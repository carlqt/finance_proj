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

class Item < ActiveRecord::Base
  belongs_to :form
end
