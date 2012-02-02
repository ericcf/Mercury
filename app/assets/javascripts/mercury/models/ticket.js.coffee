class Mercury.Models.Ticket extends Backbone.Model

  url: ->
    "/tickets"

  validate: (attrs) ->
    if typeof attrs.comment == "string"
      if String(attrs.comment).replace(/^\s+|\s+$/g, '') == ""
        { responseText: JSON.stringify( errors: { comment: ["can't be blank"] } ) }
      else if attrs.comment.length >= 65536
        { responseText: JSON.stringify( errors: { comment: ["is too long (maximum is 65536 characters"] } ) }
