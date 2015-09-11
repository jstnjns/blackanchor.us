angular
  .module 'ba.controllers.product', []
  .controller 'productCtrl', ($scope, $http, $sce) ->
    $scope.product = window.product
    $scope.preview = $scope.product.images[0]

    $http
      .get '/pages/products-backpack'
      .then (response) ->
        content = $(response.data).find('#content .container').html()
        trusted = $sce.trustAsHtml content
        $scope.extra = trusted