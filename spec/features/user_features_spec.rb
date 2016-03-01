require 'rails_helper'

feature 'Sign up' do
  scenario 'User can sign up and sign in automatically' do
    sign_up('test@test.com', 'password')
    expect(page).to have_link 'Sign out'
  end

  scenario 'redirected to dashboard' do
    sign_up('test@test.com', 'password')
    expect(current_path).to eq('/dashboard')
  end
end


def sign_up(email, password)
  visit root_url
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end
