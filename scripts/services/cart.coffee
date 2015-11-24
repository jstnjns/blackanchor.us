angular
  .module 'ba.services.cart', []
  .service 'Cart', ($rootScope, $http) ->

    cart: window.cart


    fetch: ->
      $http
        .get '/cart.js'
        .success (response) =>
          @cart = response

          $rootScope.$broadcast 'cart:change', @cart


    add: (id) ->
      product =
        id: id
        quantity: 1

      $http
        .post '/cart/add.js', product
        .success (data) =>
          # If there is already a line item for this product
            # Replaced line item with response data
          # Else
            # Add new line item with response data

          @cart.items =
            @cart.items.map (item) -> if item.id is data.id then data else item

          $rootScope.$broadcast 'cart:change', @cart
          $rootScope.$broadcast 'cart:add', data


    update: (id, quantity) ->
      data = updates: {}
      data.updates[id] = quantity

      $http
        .post '/cart/update.js', data
        .success (response) =>
          @cart = response

          $rootScope.$broadcast 'cart:change', @cart


    remove: (id) ->
      data = updates: {}
      data.updates[id] = 0

      $http
        .post '/cart/update.js', data
        .success (response) =>
          @cart = response

          $rootScope.$broadcast 'cart:change', @cart