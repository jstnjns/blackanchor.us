Array::unique = ->
  output = {}
  output[@[key]] = @[key] for key in [0...@length]
  value for key, value of output

Array::like = (other) ->
  return false if other.length isnt @.length
  for key, value of other
    return false unless @[key] is value
  true

angular
  .module 'ba.controllers.product', []
  .controller 'productCtrl', ($scope, $http, $sce) ->
    $scope.product = window.product
    $scope.variant = window.variant
    $scope.options = angular.copy $scope.variant.options

    $scope.variationsFor = (option) ->
      i = $scope.product.options.indexOf option
      variations = $scope.product.variants.map (variant) ->
        variant.options[i]
      variations.unique()


    init = ->
      $scope.$watch 'options', onOptionsChange, true


    onOptionsChange = (newOptions) ->
      $scope.variant = variantFor newOptions


    variantFor = (options) ->
      variants = $scope.product.variants.filter (variant) ->
        variant.options.like options

      variants[0]


    do init


    # $http
    #   .get '/pages/products-backpack'
    #   .then (response) ->
    #     content = $(response.data).find('#content .container').html()
    #     trusted = $sce.trustAsHtml content
    #     $scope.extra = trusted