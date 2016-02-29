require 'rails_helper'

feature 'home' do
  scenario 'has a signup link' do
    visit root_url
    expect(page).to have_link 'Sign up'
  end
  scenario 'has a login link' do
    visit root_url
    expect(page).to have_link 'Log in'
  end
end
