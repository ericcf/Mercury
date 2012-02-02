require 'test_helper'
require_relative "./pages/tickets_index"

class TicketSubmissionTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver
    @ticket_form = TicketsIndex.new(page)
  end

  test "A user submits an empty ticket" do
    @ticket_form.visit
    @ticket_form.comment = ""
    @ticket_form.submit
    assert @ticket_form.error_notice.
      has_content?("Oops, there was a problem. comment can't be blank")
  end

  test "A user submits a ticket" do
    @ticket_form.visit
    @ticket_form.comment = "I want more unicorns."
    @ticket_form.submit
    assert @ticket_form.success_notice.
      has_content?("Submitted! Thanks for your feedback.")
    assert_equal "", @ticket_form.comment
  end

  test "A user submits a ticket and an e-mail address" do
    @ticket_form.visit
    @ticket_form.comment = "There are too many widgets."
    @ticket_form.email = "foo@example.com"
    assert_difference("Subscriber.count") do
      @ticket_form.submit
      # ensure the block doesn't complete until the ajax returns
      assert @ticket_form.success_notice.
        has_content?("Submitted! Thanks for your feedback.")
    end
    assert_equal "", @ticket_form.comment
  end
end
