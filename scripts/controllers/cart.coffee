angular
  .module 'ba.controllers.cart', []
  .controller 'cartCtrl', ($scope, $http, Cart) ->

    $scope.cart = {}

    init = ->
      $scope.$on 'cart:change', onCartChange
      $scope.$on 'cart:add', onCartAdd
      $scope.cart = Cart.cart


    onCartChange = (event, cart) ->
      $scope.cart = cart


    onCartAdd = (event, product) ->
      $scope.show = true


    $scope.remove = Cart.remove
    $scope.update = Cart.update


    do init
