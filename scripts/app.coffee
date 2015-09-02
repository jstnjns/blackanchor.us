angular
  .module 'ba', [
    'ba.controllers'
  ]
  .config ($interpolateProvider) ->
    $interpolateProvider
      .startSymbol '[['
      .endSymbol ']]'

