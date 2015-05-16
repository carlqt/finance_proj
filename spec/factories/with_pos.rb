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
  factory :po_form, class: WithPo do
    engineer  "Bruce Wayne"
    sequence(:po) {|n| "po #{n}"}
    sequence(:jo) {|n| "jo #{n}"}
    sequence(:page) {|n| "page #{n}"}
    total_amount 20
    letter_code 'a'
  end


end
