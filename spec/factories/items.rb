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
    description "MyText"
quantity 1
form_id 1
  end

end
