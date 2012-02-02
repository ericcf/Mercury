#= require mercury/templates/ticket_details
#= require mercury/collections/ticket_details

class Mercury.Views.TicketDetailsView extends Backbone.View

  template: JST["mercury/templates/ticket_details"]

  initialize: ->
    @collection = new Mercury.Collections.TicketDetails
    @collection.fetch
      success: (collection, response) =>
        this.render()
      error: (collection, response) ->

  render: =>
    $(@el).html @template( collection: @collection )
    this
