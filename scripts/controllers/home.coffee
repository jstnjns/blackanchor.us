angular
  .module 'ba.controllers.home', []
  .controller 'homeCtrl', ($scope, $http) ->

    $http
      .get '/pages/home'
      .then (response) ->
        content = $(response.data).find('#dynamic').html()
        $scope.dynamic = content