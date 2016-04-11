angular
  .module 'ba', [
    'ba.controllers',
    'ba.services'
  ]

  .config ($interpolateProvider) ->
    $interpolateProvider
      .startSymbol '[['
      .endSymbol ']]'