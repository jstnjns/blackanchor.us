Array::unique = ->
  output = {}
  output[@[key]] = @[key] for key in [0...@length]
  value for key, value of output

Array::like = (other) ->
  return false if other.length isnt @length
  for key, value of other
    return false unless @[key] is value
  true

Array::at = (n) ->
  if n >= 0 then @[n] else @[@length + n]