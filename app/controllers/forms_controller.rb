class FormsController < ApplicationController
  before_action :status_count, only: :index

  def index
    if params[:without_po]
      @form = WithoutPo.all.status(params[:status])
    else
      @form = WithPo.all.status(params[:status])
    end
  end

  private
  def status_count
    object = params[:wihtout_po] ? 'WithoutPo'.constantize : 'WithPo'.constantize

      @pending_count = object.status('pending').count
      @submitted_count = object.status('submitted').count
      @approved_count = object.status('approved').count
  end
end
