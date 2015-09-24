angular
  .module 'ba.services.cart', []
  .service 'Cart', ($rootScope, $http) ->

    cart: []

    fetch: ->
      window.CartOrig = @
      $http
        .get '/cart.js'
        .success (data) =>
          @cart = data
          $rootScope.$broadcast 'cart:change', @cart

    add: (product) ->
      $http
        .post '/cart/add.js', product
        .success (data) =>
          @cart.items.push data
          $rootScope.$broadcast 'cart:change', @cart
