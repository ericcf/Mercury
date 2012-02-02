#= require mercury/models/ticket

class Mercury.Collections.TicketDetails extends Backbone.Collection

  model: Mercury.Models.Ticket

  url: "/tickets"
