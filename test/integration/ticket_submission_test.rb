require 'test_helper'

class TicketSubmissionTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver
  end

  test "A user submits an empty ticket" do
    visit "/"
    page.fill_in "comment", with: ""
    page.find("input[type=submit]").click
    assert page.find("#notice > .alert-message.error").
      has_content?("Oops, there was a problem. Comment can't be blank")
  end

  test "A user submits a ticket" do
    visit "/"
    page.fill_in "comment", with: "I want more unicorns."
    page.find("input[type=submit]").click
    assert page.find("#notice > .alert-message.success").
      has_content?("Submitted! Thanks for your feedback.")
  end
end
