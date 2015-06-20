class FormsController < ApplicationController
  def index
    if params[:without_po]
      @form = WithoutPo.all
    else
      @form = WithPo.all
    end
  end
end
