# == Schema Information
#
# Table name: without_pos
#
#  id             :integer          not null, primary key
#  transaction_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class WithoutPo < ActiveRecord::Base
end
