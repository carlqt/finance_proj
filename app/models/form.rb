# == Schema Information
#
# Table name: forms
#
#  id            :integer          not null, primary key
#  letter_code   :string
#  requestor     :string
#  secretary     :string
#  payment_type  :string
#  company_name  :string
#  total_amount  :decimal(, )
#  supplier      :string
#  actable_id    :integer
#  actable_type  :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  title         :string
#  name_of_check :string
#  cv_number     :integer
#

class Form < ActiveRecord::Base
  actable
  has_many :items
  accepts_nested_attributes_for :items

  before_create :generate_letter_code

  private
  def generate_letter_code

    if new_day?
      self.letter_code = '1'
    else
      self.letter_code = Form.last.letter_code.succ
    end
  end

  def new_day?
    return true unless Form.exists?
    last_date = Form.last.created_at.to_date

    if Date.current != last_date
      true
    else
      false
    end
  end
end
