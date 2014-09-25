app = angular.module("myApp", [])

app.controller "myController",['$scope', ($scope) ->
  $scope.calc = "0"
  console.log('heyyyy')

  $scope.calculate = (value)->
    $scope.calc = value
]