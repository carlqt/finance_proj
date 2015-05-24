class FormsController < ApplicationController

  def index
    @form_without_pos = WithoutPo.all
    @form_with_pos = WithPo.all
  end

  def select

  end

  private
  def forms_params

  end
end
