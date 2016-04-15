angular
  .module 'ba.directives.pane.window', []
  .directive 'paneWindow', ->
    restrict: 'C'
    scope: percent: '=?paneWindow'
    link: ($scope, $elm, $attrs) ->
      percent = ($scope.percent/100) or 1

      $ window
        .on 'resize', (event) ->
          $elm.height @innerHeight * percent
        .trigger 'resize'