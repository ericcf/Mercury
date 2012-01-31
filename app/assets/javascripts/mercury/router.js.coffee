#= require mercury/views/new_ticket_form_view

class Mercury.Router extends Backbone.Router

  routes:
    "*path": "index"

  index: ->
    new Mercury.Views.NewTicketFormView( el: "#new-ticket-form" )
