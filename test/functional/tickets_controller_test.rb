require 'test_helper'

class TicketsControllerTest < ActionController::TestCase

  test "GET 'index'" do
    get :index
    assert_response :success
  end

  test "POST create success" do
    post :create, format: :json, comment: "TGIF"
    assert_response :created
  end

  test "POST create error" do
    mock_ticket = mock(Ticket.new)
    mock_ticket.save { false }
    mock_ticket.errors.mock!.full_messages { [] }
    mock(Ticket).new({}) { mock_ticket }
    post :create, format: :json
    assert_response :bad_request
  end
end
