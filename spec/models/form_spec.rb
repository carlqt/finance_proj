# == Schema Information
#
# Table name: forms
#
#  id            :integer          not null, primary key
#  letter_code   :integer
#  requestor     :string
#  secretary     :string
#  payment_type  :string
#  company_name  :string
#  total_amount  :decimal(, )
#  supplier      :string
#  formable_id   :integer
#  formable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Form, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
