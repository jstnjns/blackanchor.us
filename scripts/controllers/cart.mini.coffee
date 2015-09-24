angular
  .module 'ba.controllers.cart.mini', []
  .controller 'cartMiniCtrl', ($scope, $http, Cart) ->

    $scope.cart = []

    init = ->
      $scope.$on 'cart:change', onCartChange
      Cart.fetch()

    onCartChange = (event, cart)->
      $scope.cart = cart

    do init