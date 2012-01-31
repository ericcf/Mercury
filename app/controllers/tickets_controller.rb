class TicketsController < ApplicationController

  respond_to :html, only: :index
  respond_to :json, only: :create

  def index
  end

  def show
  end

  def create
    ticket = Ticket.new(safe_params(params, Ticket))
    ticket.tap do |t|
      t.ip_address = request.remote_ip
      t.user_agent = request.user_agent
    end

    if ticket.save
      respond_with ticket
    else
      render json: { error: errors_on(ticket) },
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
