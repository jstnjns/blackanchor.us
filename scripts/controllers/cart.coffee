angular
  .module 'ba.controllers.cart', []
  .controller 'cartCtrl', ($scope, $http, Cart) ->

    init = ->
      $scope.cart = window.cart

    do init