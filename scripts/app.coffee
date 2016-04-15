angular
  .module 'ba', [
    'ba.controllers'
    'ba.directives'
    'ba.services'
  ]

  .config ($interpolateProvider) ->
    $interpolateProvider
      .startSymbol '[['
      .endSymbol ']]'