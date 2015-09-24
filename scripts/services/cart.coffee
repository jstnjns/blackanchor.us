angular
  .module 'ba.services.cart', []
  .service 'Cart', ($rootScope, $http) ->

    items: []

    fetch: ->
      $http
        .get '/cart.js'
        .success (data) ->
          console.log 'cart', data

    add: (product) ->
      $http
        .post '/cart/add.js', product
        .success (data) ->
          console.log 'add', data