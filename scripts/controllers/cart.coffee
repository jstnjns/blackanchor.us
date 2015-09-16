angular
  .module 'ba.controllers.cart', []
  .controller 'cartCtrl', ($scope, $http, $sce) ->
    $scope.cart = window.cart


    init = ->


    do init