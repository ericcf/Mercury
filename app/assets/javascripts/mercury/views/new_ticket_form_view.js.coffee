#= require mercury/templates/new_ticket_form
#= require mercury/models/ticket
#= require mercury/views/notice_view

class Mercury.Views.NewTicketFormView extends Backbone.View

  template: JST["mercury/templates/new_ticket_form"]

  events:
    "click button.submit": "_save"

  initialize: ->
    this._newModel()
    this.render()

  render: (errors = new Mercury.Models.Errors) =>
    $(@el).html @template( model: @model, errors: errors )
    this

  _newModel: ->
    @model = new Mercury.Models.Ticket

  _save: ->
    (@model).save this.serializeForm(),
      success: (model, response) =>
        new Mercury.Views.NoticeView("Submitted! Thanks for your feedback.")
        this._newModel()
        this.render()
      error: (model, response) =>
        errors = new Mercury.Models.Errors
        if response.status == 500
          errors.summary = "We've been notified and will fix it as soon as possible."
        else
          errors.errors = JSON.parse(response.responseText).errors
        new Mercury.Views.ErrorNoticeView("Oops, there was a problem. #{errors.getSummary()}")
        this.render(errors)
    false
