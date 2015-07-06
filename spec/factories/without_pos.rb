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
  factory :without_po, class: WithoutPo do
    requestor Faker::Name.name
    secretary Faker::Name.name
    payment_type %w(Cash Check).sample
    company_name Faker::Company.name
    supplier Faker::Company.name
    sequence(:transaction_number) {|n| n }
    total_amount 20
    status 'pending'

    before(:create) do |without_po|
      without_po.items << FactoryGirl.build(:item)
    end
  end


end
