# == Schema Information
#
# Table name: without_pos
#
#  id                 :integer          not null, primary key
#  transaction_number :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe WithoutPo, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
