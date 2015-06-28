class WithoutPosController < ApplicationController
  include FormsMethodController
  before_action :initialize_po, except: [:index, :new, :create]

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
    flash.now[:alert] = "You have an error when creating the form"
    render :new
  end

  def edit
  end

  def update
    @without_po = WithoutPo.find params[:id]
    return redirect_to(root_path) if @without_po.update_attributes(form_params)
    flash.now[:alert] = "You have an error when updating the form"
    render :edit
  end

  def reject
    @without_po.reject!
    redirect_to :back, success: "Form has been rejected"
  end

  def approve
    @without_po.approve!
    redirect_to :back, success: "Form has been approved"
  end

  def submit
    @without_po.submit!
    redirect_to :back, success: "Form has been submitted"
  end

  private
  def initialize_po
    @without_po = WithoutPo.find params[:id]
  end

  def form_params
    params.require(:without_po).permit(:requestor, :company_name, :secretary, :transaction_number,
                                    :letter_code, :requestor, :payment_type, :total_amount,
                                    :supplier, :title, :name_of_check, :cv_number, items_attributes: [:name, :description, :quantity, :_destroy, :id])
  end
end
