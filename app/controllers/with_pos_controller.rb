class WithPosController < ApplicationController
  def new
    @po = WithPo.new(letter_code: 'a')
  end

  def create
    @form = WithPo.new form_params
    return redirect_to(root_path) if @form.save
    render :new
  end

  private
  def form_params
    params.require(:with_po).permit(:requestor, :company_name, :secretary, :engineer, :jo, :po,
                                    :page, :letter_code, :requestor, :payment_type, :total_amount,
                                    :supplier, :title, :name_of_check, :cv_number, items_attributes: [:name, :description, :quantity, :_destroy])
  end
end
