class FormsController < ApplicationController
  def index
    @po = WithPo.new
    @without_po = WithoutPo.new
  end

  private
  def forms_params

  end
end
