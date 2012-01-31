#= require mercury/templates/notice

class Mercury.Views.NoticeView extends Backbone.View

  template: JST["mercury/templates/notice"]

  el: "#notice"

  initialize: (@text) ->
    this.render()
    $(@el).find(".alert-message").addClass("success")
    this

  render: =>
    $(@el).html @template( text: @text )
    this

class Mercury.Views.ErrorNoticeView extends Mercury.Views.NoticeView

  initialize: (@text) ->
    this.render()
    $(@el).find(".alert-message").addClass("error")
    this
