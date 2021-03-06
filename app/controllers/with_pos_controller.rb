class WithPosController < ApplicationController
  include FormsMethodController
  before_action :initialize_po, except: [:index, :new, :create]

  def index
    @form = WithPo.all.status(params[:status]).order(updated_at: :desc)
  end

  def new
    @po = current_user.with_pos.new
  end

  def show
    @items = @po.items
  end

  def create
    @po = current_user.with_pos.new form_params
    @po.status = 'submitted' if params[:submit]
    return redirect_to(root_path, success: "Form created") if @po.save
    flash.now[:alert] = @po.errors.full_messages
    render :new
  end

  def update
    @po.status = 'approved' if params[:approve]
    return redirect_to(with_pos_path, success: "Form updated successfully") if @po.update_attributes(form_params)
    flash.now[:alert] = "You have an error when updating the form"
    render :edit
  end

  def edit
  end

  def reject
    @po.reject!
    redirect_to :back, success: "Form has been rejected"
  end

  def approve
    @po.approve!
    redirect_to :back, success: "Form has been approved"
  end

  def submit
    @po.submit!
    redirect_to :back, success: "Form has been submitted"
  end

  private
  def initialize_po
    @po = WithPo.find params[:id]
  end

  def form_params
    params.require(:with_po).permit(:requestor, :company_name, :secretary, :engineer, :jo, :po,
                                    :page, :letter_code, :requestor, :payment_type, :total_amount,
                                    :supplier, :title, :name_of_check, :cv_number, items_attributes: [:name, :description, :quantity, :_destroy, :id])
  end
end
