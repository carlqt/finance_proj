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

RSpec.describe WithPo do
  describe "form" do
    it "returns" do
      po = create(:po_form)
    end
  end
end
