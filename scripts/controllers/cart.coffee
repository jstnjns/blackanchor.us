angular
  .module 'ba.controllers.cart', []
  .controller 'cartCtrl', ($scope, $http, Cart) ->

    $scope.cart = {}

    init = ->
      $scope.$on 'cart:change', onCartChange
      $scope.cart = Cart.cart


    onCartChange = (event, cart) ->
      $scope.cart = cart


    $scope.remove = Cart.remove
    $scope.update = Cart.update


    do init