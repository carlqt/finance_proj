# == Schema Information
#
# Table name: without_pos
#
#  id                 :integer          not null, primary key
#  transaction_number :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class WithoutPo < ActiveRecord::Base
  include FormMethods
  acts_as :form
  validates :transaction_number, presence: true
end
