spec/features/home_spec.rb

require 'rails_helper'

RSpec.describe "Home Page", type: :feature do
  describe "GET /" do

    it "should access root and see some links" do
      visit root_path
      expect(page).to have_selector(:css, 'a[href="#"]', text: 'Home')
      expect(page).to have_selector(:css, 'a[href="#"]', text: 'Contact')
      expect(page).to have_selector(:css, "a[href='#{root_path}']", text: 'Login')
      expect(page).to have_selector(:css, 'a[href="#"]', text: 'Registrar')
    end

  end
end