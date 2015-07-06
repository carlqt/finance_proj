# == Schema Information
#
# Table name: forms
#
#  id            :integer          not null, primary key
#  letter_code   :string
#  requestor     :string
#  secretary     :string
#  payment_type  :string
#  company_name  :string
#  total_amount  :decimal(, )
#  supplier      :string
#  actable_id    :integer
#  actable_type  :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  title         :string
#  name_of_check :string
#  cv_number     :integer
#  status        :string           default("pending")
#

require 'rails_helper'

RSpec.describe Form, :type => :model do
  describe ".generate_letter_code" do
    let!(:form_2) { create :with_po }

    context "when form is created the next day" do
      before do
        user_form = create :with_po
        user_form.form.update_attribute :created_at, Time.current - 24.hour
      end

      let!(:form) { create :with_po }

      it "resets to 1" do
        expect(form.letter_code).to eq "1"
      end
    end

    context "when form is created on the same day" do
      let!(:form) { create :with_po}

      it "increments sequentially" do
        expect(form.letter_code).to eq "2"
      end

      context "when with_po form was created first" do
        let!(:form) { create :without_po }
        it "increments sequentially" do
          expect(form.letter_code).to eq "2"
        end
      end
    end
  end
end
