class WithoutPosController < ApplicationController
  include FormsMethodController

  def index
    @form = WithoutPo.all.status params[:status]
  end

  def new
    @without_po = WithoutPo.new
  end

  def create
    @form = WithoutPo.new form_params
    @form.status = 'submitted' if params[:submit]
    @form.status = 'approved' if params[:approved]
    return redirect_to(root_path) if @form.save
    render :new
  end

  def edit
    @without_po = WithoutPo.find params[:id]
  end

  private
  def form_params
    params.require(:without_po).permit(:requestor, :company_name, :secretary, :transaction_number,
                                    :letter_code, :requestor, :payment_type, :total_amount,
                                    :supplier, :title, :name_of_check, :cv_number, items_attributes: [:name, :description, :quantity, :_destroy])
  end
end
