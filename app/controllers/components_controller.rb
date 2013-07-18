require 'down/sse'

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
    sse = Down::SSE.new(response.stream)
    redis = Redis.new
    redis.subscribe('down:transitions') do |on|
      on.message do |event, data|
        sse.write data, event: 'update'
      end
    end
  ensure
    sse.close
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
