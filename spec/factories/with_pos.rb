# == Schema Information
#
# Table name: with_pos
#
#  id         :integer          not null, primary key
#  engineer   :string
#  po         :integer
#  jo         :integer
#  page       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :with_po, class: WithPo do
    engineer  Faker::Name.name
    requestor Faker::Name.name
    secretary Faker::Name.name
    payment_type %w(Cash Check).sample
    company_name Faker::Company.name
    supplier Faker::Company.name
    sequence(:po) {|n| n }
    sequence(:jo) {|n| n }
    sequence(:page) {|n| n}
    total_amount 20
    status 'pending'

    before(:create) do |with_po|
      with_po.items << FactoryGirl.build(:item)
    end
  end

end
