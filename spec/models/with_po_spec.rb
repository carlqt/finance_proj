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

require 'rails_helper'

RSpec.describe WithPo, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
