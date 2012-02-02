#= require mercury/views/top_navigation_view
#= require mercury/views/new_ticket_form_view
#= require mercury/views/ticket_details_view

class Mercury.Router extends Backbone.Router

  routes:
    "manage": "manage"
    "*path": "index"

  initialize: ->
    @views = []
    new Mercury.Views.TopNavigationView( el: "#top-navigation" )

  index: ->
    this._cleanup()
    $("#components").append("<div id='new-ticket-form'></div>")
    this._addView(new Mercury.Views.NewTicketFormView( el: "#new-ticket-form" ))

  manage: ->
    this._cleanup()
    $("#components").append("<div id='ticket-details'></div>")
    this._addView(new Mercury.Views.TicketDetailsView( el: "#ticket-details" ))

  _addView: (view) ->
    @views.push view

  _cleanup: ->
    v.remove() for v in @views
    @views = []
