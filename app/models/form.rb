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
#  status        :string           default("pending")
#

class Form < ActiveRecord::Base
  actable
  include Workflow

  has_many :items
  accepts_nested_attributes_for :items, allow_destroy: true

  before_create :generate_letter_code

  validates :payment_type, inclusion: { in: %w(Check Cash) }
  validates :company_name, :requestor, :secretary, :supplier, :total_amount, presence: true

  workflow_column :status
  workflow do
    state :pending do
      event :submit, transitions_to: :submitted
    end

    state :submitted do
      event :approve, transitions_to: :approved
      event :reject, transitions_to: :rejected
    end

    state :rejected do
      event :submit, transitions_to: :submitted
      event :save, transitions_to: :pending
    end

    state :approved
  end

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
