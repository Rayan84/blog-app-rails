require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  scenario 'login page' do
    visit new_user_registration_path
    expect(page).to have_content('Log in')
  end
end