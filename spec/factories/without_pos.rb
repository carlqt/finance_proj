FactoryGirl.define do
  factory :without_po_form, class: WithoutPo do
    engineer  "Bruce Wayne"
    sequence(:transaction_number) { |n| n } 
    total_amount 20
    form
  end


end
