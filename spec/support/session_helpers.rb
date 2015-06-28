module SessionHelpers
  # half-way done
  def sign_in_as(username = 'batman', password = 'password')
    visit new_user_session_path
    fill_in 'user_username', with: username
    fill_in 'user_password', with: password
    click_button "Log in"
  end
end