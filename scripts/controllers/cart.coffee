angular
  .module 'ba.controllers.cart', []
  .controller 'cartCtrl', ($scope, $http, Cart) ->

    $scope.items = []

    init = ->
      $scope.items = Cart.fetch()


    do init