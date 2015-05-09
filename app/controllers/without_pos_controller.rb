class WithoutPosController < ApplicationController
  def new
    @without_po = WithoutPo.new
  end

  def create

  end
end
