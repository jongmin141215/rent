require 'rails_helper'

feature 'Landlord sign up' do
  scenario 'can sign up as landlord' do
    visit signup_url
    click_link 'Sign up as Landlord'
    expect(current_path).to eq new_landlord_registration_path
  end

  scenario 'includes first and last name input fields' do
    visit new_landlord_registration_path

    expect(page).to have_selector 'input[name="landlord[first_name]"]'
    expect(page).to have_selector 'input[name="landlord[last_name]"]'
  end

  scenario 'requires business type' do
    visit new_landlord_registration_path
    expect(page).to have_selector 'select[name="landlord[business_type]"]'
  end

  scenario 'requires data of birth' do
    visit new_landlord_registration_path
    expect(page).to have_selector 'input[name="landlord[date_of_birth]"]'
  end

  scenario 'requires more info if they want more than $3000 payment' do
    visit new_landlord_registration_path
    expect(page).to have_content "Additional information If you'd like to receive more than $3000, please fill out the additional information"
    expect(page).to have_selector 'input[name="landlord[ssn]"]'
    expect(page).to have_selector 'input[name="landlord[address]"]'
  end

  scenario 'creates a landlord with valid info' do
    landlord_signup
    expect{ click_button 'Sign up' }.to change(Landlord, :count).by(1)
    expect(Landlord.last.first_name).to eq 'Jongmin'
  end

  scenario 'displays the "Sign out" link when signed in' do
    landlord_signup
    click_button 'Sign up'
    expect(page).not_to have_link 'Sign up'
    expect(page).not_to have_link 'Log in'
  end
end



def landlord_signup
  visit new_landlord_registration_path
  select 'individual', from: 'landlord[business_type]'
  fill_in 'landlord[first_name]', with: 'Jongmin'
  fill_in 'landlord[last_name]', with: 'Kim'
  fill_in 'landlord[email]', with: 'test@test.com'
  fill_in 'landlord[date_of_birth]', with: '05/28/1983'
  fill_in 'landlord[password]', with: 'password'
  fill_in 'landlord[password_confirmation]', with: 'password'
  fill_in 'landlord[ssn]', with: '1234'
  fill_in 'landlord[address]', with: '3674 Torrey View Ct'
end
