angular
  .module 'ba.controllers.product', []
  .controller 'productCtrl', ($scope, $http, $sce, $window, Cart) ->
    $scope.product = window.product
    $scope.variant = window.variant
    $scope.options = angular.copy $scope.variant.options


    $scope.variationsFor = (option) ->
      i = $scope.product.options.indexOf option
      variations = $scope.product.variants.map (variant) ->
        variant.options[i]
      variations.unique()


    $scope.addToCart = ->
      Cart.add $scope.variant.id


    init = ->
      $scope.$watch 'options', onOptionsChange, true
      do getDynamicContent


    onOptionsChange = (newOptions) ->
      $scope.variant = variantFor newOptions


    variantFor = (options) ->
      variants = $scope.product.variants.filter (variant) ->
        variant.options.like options

      variants[0]


    getDynamicContent = ->
      slug = $window.location.pathname.substr(1).split('/').at(-1)

      $http
        .get "/pages/#{slug}"
        .then (response) ->
          content = $(response.data).find('#dynamic').html()
          trusted = $sce.trustAsHtml content
          $scope.dynamic = trusted
          $scope.balls = 'hi'


    do init


