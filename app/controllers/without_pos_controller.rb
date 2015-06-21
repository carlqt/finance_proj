class WithoutPosController < ApplicationController
  include FormsMethodController

  def index
    @form = WithoutPo.all.status params[:status]
  end

  def new
    @without_po = WithoutPo.new
  end

  def show
    @form = WithoutPo.find params[:id]
    @items = @form.items
  end

  def create
    @without_po = WithoutPo.new form_params
    @without_po.status = 'submitted' if params[:submit]
    @without_po.status = 'approved' if params[:approved]
    return redirect_to(root_path, success: "Form created") if @without_po.save
    render :new
  end

  def edit
    @without_po = WithoutPo.find params[:id]
  end

  def update
    @without_po = WithoutPo.find params[:id]
    return redirect_to(root_path) if @without_po.update_attributes(form_params)
    render :edit
  end

  private
  def form_params
    params.require(:without_po).permit(:requestor, :company_name, :secretary, :transaction_number,
                                    :letter_code, :requestor, :payment_type, :total_amount,
                                    :supplier, :title, :name_of_check, :cv_number, items_attributes: [:name, :description, :quantity, :_destroy, :id])
  end
end
