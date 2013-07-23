class ComponentsController < ApplicationController
  include ActionController::Live

  protect_from_forgery only: :index

  respond_to :json, only: [:repaired]

  def index
    @components = Component.all
    @transitions = ComponentStatusTransition.order('created_at DESC').first(20)
  end

  def repaired
    update(params[:id], 'repaired')
  end

  def crashed
    update(params[:id], 'crashed')
  end

  def fault
    update(params[:id], 'fault')
  end

  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    redis = Redis.new
    redis.subscribe('crier:transitions') do |on|
      on.message do |event, data|
        response.stream.write "data: #{JSON.dump(data)}"
        response.stream.write "\n\n"
      end
    end
  ensure
    response.stream.close
  end

  private

  def update(id, status)
    @component = Component.find(id)
    @component.send(status)
    if @component.save
      head 200
    else
      head 500
    end
  end

end
