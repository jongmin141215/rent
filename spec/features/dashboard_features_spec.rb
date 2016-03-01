require 'rails_helper'

feature 'Pay rent' do
  before do
    sign_up('test@test.com', 'password')
    click_link 'Pay Rent'
  end
  scenario "asks customer's clear and legible consent" do
    expect(page).to have_selector 'input[type="checkbox"]'
    expect(page).to have_content 'I authorize Rent to electronically debit my account and, if necessary, electronically credit my account to correct erroneous debits.'
  end

  scenario "asks two methods to verify and collect customers' bank account and routing number" do
    expect(page).to have_link 'Instant Verification'
    expect(page).to have_link 'Delayed Verification (Micro-deposits)'
  end

  scenario 'cannot click a method button if the checkbox is not checked', js: true do
    click_link 'Instant Verification'
    expect(page).to have_link 'Instant Verification'
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
