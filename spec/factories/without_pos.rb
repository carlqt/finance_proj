# == Schema Information
#
# Table name: without_pos
#
#  id                 :integer          not null, primary key
#  transaction_number :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryGirl.define do
  factory :without_po_form, class: WithoutPo do
    engineer  "Bruce Wayne"
    sequence(:transaction_number) { |n| n } 
    total_amount 20
    form
  end


end
