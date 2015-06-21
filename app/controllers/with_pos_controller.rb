class WithPosController < ApplicationController
  include FormsMethodController

  def index
    @form = WithPo.all.status(params[:status])
  end

  def new
    @po = WithPo.new
  end

  def create
    @form = WithPo.new form_params
    @form.status = 'submitted' if params[:submit]
    return redirect_to(root_path) if @form.save
    render :new
  end

  def update
    @form = WithPo.find params[:id]
    @form.status = 'approved' if params[:approve]
    return redirect_to(root_path) if @form.update_attributes(form_params)
    render :edit
  end

  def edit
    @po = WithPo.find(params[:id])
  end

  private
  def form_params
    params.require(:with_po).permit(:requestor, :company_name, :secretary, :engineer, :jo, :po,
                                    :page, :letter_code, :requestor, :payment_type, :total_amount,
                                    :supplier, :title, :name_of_check, :cv_number, items_attributes: [:name, :description, :quantity, :_destroy, :id])
  end
end
