# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  description :text
#  quantity    :integer
#  form_id     :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :item do
    sequence(:description) { |n| "MyItem #{n}"}
    sequence(:quantity) { |n| n }
  end

end
