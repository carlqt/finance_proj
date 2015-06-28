# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(admin secretary).each do |username|
  user = User.new
  user.username = username
  user.type = username.capitalize
  user.password = 'password'
  user.password_confirmation = 'password'
  user.save
end

User.all.each do |user|
  5.times do
    user.with_pos.create!(requestor: Faker::Name.name, secretary: Faker::Name.name, payment_type: %w(Cash Check).sample, company_name: Faker::Company.name, total_amount: Faker::Commerce.price.round(2), supplier: Faker::Company.name, engineer: Faker::Name.name)
  end

  5.times do
    user.without_pos.create!(requestor: Faker::Name.name, secretary: Faker::Name.name, payment_type: %w(Cash Check).sample, company_name: Faker::Company.name, total_amount: Faker::Commerce.price.round(2), supplier: Faker::Company.name, transaction_number: Faker::Number.number(5))
  end
end
