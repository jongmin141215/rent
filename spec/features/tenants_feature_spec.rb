require 'rails_helper'

feature 'Tenant sign up' do
  # scenario 'User can sign up and sign in automatically' do
  #   sign_up('test@test.com', 'password')
  #   expect(page).to have_link 'Sign out'
  # end
  #
  # scenario 'redirected to dashboard' do
  #   sign_up('test@test.com', 'password')
  #   expect(current_path).to eq('/dashboard')
  # end

  scenario 'can see two signup forms (landlord & tenant)' do
    visit root_url
    click_link 'Sign up'
    expect(current_path).to eq '/signup'
    expect(page).to have_content 'Sign up as Tenant Sign up as Landlord'
  end

  scenario 'can sign up as tenant' do
    visit signup_url
    click_link 'Sign up as Tenant'
    expect(current_path).to eq new_user_registration_path
  end

  scenario 'requires first and last name input fields' do
    visit new_user_registration_path
    expect(page).to have_selector 'input[name="user[first_name]"]'
    expect(page).to have_selector 'input[name="user[last_name]"]'
  end

  scenario 'requires data of birth' do
    visit new_user_registration_path
    expect(page).to have_selector 'input[name="user[date_of_birth]"]'
  end

  scenario 'creates a tenant with valid info' do
    expect{ tenant_sign_up }.to change(User, :count).by(1)
    expect(User.last.last_name).to eq 'Kim'
  end

  def tenant_sign_up
    visit new_user_registration_path
    fill_in 'user[first_name]', with: 'Jongmin'
    fill_in 'user[last_name]', with: 'Kim'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[date_of_birth]', with: '05/28/1983'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
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
