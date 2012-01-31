Backbone.View::serializeForm = ->
  stringParams = $(@el).find("form").serialize()
    .replace(/\+/g, " ") # preserve spaces in form values
  # decode URL encoded characters
  stringParams = decodeURIComponent(stringParams)
  # parse string and convert to an object
  values = {}
  _.each stringParams.split("&"), (param) ->
    [key, value] = param.split("=")
    if key.match(/\[\]$/)?
      # maps to an array
      arrayName = key.match(/(.*)\[\]$/)[1]
      values[arrayName] or= []
      values[arrayName] = values[arrayName].concat(value)
    else
      values[key] = value
  values
