angular
  .module 'ba.controllers.home', []
  .controller 'homeCtrl', ($scope, $http, $sce, $window) ->

    $http
      .get '/pages/home'
      .then (response) ->
        content = $(response.data).find('#dynamic').html()
        trusted = $sce.trustAsHtml content
        $scope.dynamic = trusted

    $ window
      .on 'resize', (event) -> $scope.height = @innerHeight
      .trigger 'resize'