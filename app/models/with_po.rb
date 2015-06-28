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

class WithPo < ActiveRecord::Base
  include FormMethods
  acts_as :form

  validates :engineer, presence: true

  belongs_to :user
end
