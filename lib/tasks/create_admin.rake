namespace :admin do
  desc 'Create an admin user'
  task create: :environment do
    if User.find_by(username: "admin")
      puts "Default admin is already cretated"
    else
      User.create(username: "admin", password: "password", password_confirmation: "password")
      puts "Default admin created"
      puts "username: admin"
      puts "password: password"
    end
  end
end
