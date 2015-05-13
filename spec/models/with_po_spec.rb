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
  describe "letter code attribute" do
    let!(:form) { create(:po_form) }

    it "letter code increments on every submit" do
      new_form = create(:po_form)
      expect(new_form.letter_code).to eq 'b'
    end
  end
end
