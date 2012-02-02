class TicketsController < ApplicationController

  respond_to :html, only: :index
  respond_to :json, only: [:index, :create]

  def index
    respond_with Ticket.all
  end

  def show
    respond_with Ticket.find(params[:id])
  end

  def create
    ticket = Ticket.new(safe_params(params, Ticket))
    ticket.tap do |t|
      t.ip_address = request.remote_ip
      t.user_agent = request.user_agent
    end

    if ticket.save
      ticket.find_or_create_subscriber(params[:email])
      respond_with ticket
    else
      render json: { errors: ticket.errors, summary: errors_on(ticket) },
             status: :bad_request
    end
  end

  private

  # Returns only mass-assignment whitelisted params.
  def safe_params(params, klass, role = :default)
    (params || {}).slice(*klass.accessible_attributes(role))
  end

  def errors_on(record)
    record.errors.full_messages.join ", "
  end
end
