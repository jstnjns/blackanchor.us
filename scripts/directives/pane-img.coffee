angular
  .module 'ba.directives.pane.img', []
  .directive 'paneImg', ->
    restrict: 'C'
    link: ($scope, $elm, $attrs) ->
      $elm.imagefill()
      $(window).trigger 'resize'
