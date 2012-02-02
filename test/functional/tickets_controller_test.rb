require 'test_helper'

class TicketsControllerTest < ActionController::TestCase

  test "GET 'index'" do
    get :index
    assert_response :success
  end

  def mock_ticket
    @mock_ticket ||= mock(Ticket.new)
  end

  test "POST create success" do
    mock_ticket.save { true }
    mock_ticket.find_or_create_subscriber("foo@example.org")
    mock(Ticket).new({ "comment" => "TGIF" }) { mock_ticket }
    post :create, format: :json, comment: "TGIF", email: "foo@example.org"
    assert_response :created
  end

  test "POST create error" do
    mock_ticket.save { false }
    mock_ticket.errors.twice.mock!.full_messages { [] }
    mock(Ticket).new({}) { mock_ticket }
    post :create, format: :json
    assert_response :bad_request
  end
end
