angular
  .module 'ba.directives.compile', []
  .directive 'compile', ($compile) ->
    restrict: 'A'
    replace: true
    scope: compile: '='
    link: ($scope, $elm, $attrs) ->
      $scope.$watch 'compile', (html) ->
        $elm.html html
        $compile($elm.contents())($scope)