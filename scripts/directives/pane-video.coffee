angular
  .module 'ba.directives.pane.video', []
  .directive 'paneVideo', ->
    restrict: 'C'
    link: ($scope, $elm, $attrs) ->
      $elm.imagefill({ target: 'video' })