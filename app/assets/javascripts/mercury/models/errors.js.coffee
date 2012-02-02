class Mercury.Models.Errors

  constructor: (@errors = {}) ->
    @summary = null

  on: (attr) ->
    if @errors[attr]
      @errors[attr].join(", ")

  getSummary: ->
    if @summary
      @summary
    else
      ("#{attr} #{values.join(", ")}" for attr, values of @errors).join("; ")
