#= require mercury/templates/top_navigation
#= require mercury/top_navigation

class Mercury.Views.TopNavigationView extends Backbone.View

  template: JST["mercury/templates/top_navigation"]

  initialize: ->
    @model = new Mercury.TopNavigation
    this.render()

  render: ->
    $(@el).html @template( model: @model )
    this
