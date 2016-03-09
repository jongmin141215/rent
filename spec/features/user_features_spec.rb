require 'rails_helper'

feature 'Sign up' do
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


  context 'tenant' do
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
  end

  context 'landlord' do
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
