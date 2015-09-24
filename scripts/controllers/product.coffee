Array::unique = ->
  output = {}
  output[@[key]] = @[key] for key in [0...@length]
  value for key, value of output

Array::like = (other) ->
  return false if other.length isnt @length
  for key, value of other
    return false unless @[key] is value
  true

Array::at = (n) ->
  if n >= 0 then @[n] else @[@length + n]

angular
  .module 'ba.controllers.product', []
  .controller 'productCtrl', ($scope, $http, $sce, $window) ->
    $scope.product = window.product
    $scope.variant = window.variant
    $scope.options = angular.copy $scope.variant.options


    $scope.variationsFor = (option) ->
      i = $scope.product.options.indexOf option
      variations = $scope.product.variants.map (variant) ->
        variant.options[i]
      variations.unique()


    $scope.addToCart =
      console.log arguments


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


    do init


