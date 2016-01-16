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
        .success (response) =>

          match = @cart.items.filter (item, index) ->
            console.log item.id, response.id
            @cart.items[index] = response if item.id is response.id

          if !match.length then @cart.items.push response

          do @_calculateTotals
          do @_broadcastChanage

          $rootScope.$broadcast 'cart:add', response


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


    _calculateTotals: ->
      @cart.item_count = 0
      @cart.total_price = 0

      @cart.items.forEach (item) ->
        @cart.item_count += item.quantity
        @cart.total_price += item.line_price


    _broadcastChanage: ->
      $rootScope.$broadcast 'cart:change', @cart