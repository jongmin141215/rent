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


  context 'tenant signup' do
    scenario 'can sign up as tenant' do
      visit signup_url
      click_link 'Sign up as Tenant'
      expect(current_path).to eq new_user_registration_path
    end

    scenario 'includes first and last name input fields' do
      visit new_user_registration_path
      expect(page).to have_selector 'input[name="user[first_name]"]'
      expect(page).to have_selector 'input[name="user[last_name]"]'
    end
  end

  context 'landlord signup' do
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

    scenario 'includes business type' do
      visit new_landlord_registration_path
      expect(page).to have_selector 'select'
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
