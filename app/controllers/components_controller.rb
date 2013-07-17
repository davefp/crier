class ComponentsController < ApplicationController

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
