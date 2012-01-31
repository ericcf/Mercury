#= require mercury/templates/new_ticket_form
#= require mercury/models/ticket
#= require mercury/views/notice_view

class Mercury.Views.NewTicketFormView extends Backbone.View

  template: JST["mercury/templates/new_ticket_form"]

  events:
    "click input.submit": "_save"

  initialize: ->
    this.render()

  render: =>
    $(@el).html @template( model: @model )
    this

  _save: ->
    (new Mercury.Models.Ticket).save this.serializeForm(),
      success: (model, response) =>
        new Mercury.Views.NoticeView("Submitted! Thanks for your feedback.")
      error: (model, response) ->
        if response.status == 500
          error = "We've been notified and will fix it as soon as possible."
        else
          error = JSON.parse(response.responseText).error
        new Mercury.Views.ErrorNoticeView("Oops, there was a problem. #{error}")
    false
