class Mercury.Models.Ticket extends Backbone.Model

  url: ->
    "/tickets"

  validate: (attrs) ->
    if String(attrs.comment).replace(/^\s+|\s+$/g, '') == ""
      { responseText: JSON.stringify( error: "Comment can't be blank" ) }
