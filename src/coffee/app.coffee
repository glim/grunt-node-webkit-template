"use strict"

# Declare app level module which depends on filters, and services
angular.module("myApp", [
  "ngAnimate"
  "ui.router"
  "myApp.filters"
  "myApp.services"
  "myApp.directives"
  "myApp.controllers"
]).config [
  "$stateProvider"
  "$urlRouterProvider"
  ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise '/'

    $stateProvider
    .state("home",
     url: "/"
     templateUrl: "partials/home.html"
     controller: ($scope,$state,$timeout) ->
      $scope.setFolder = (ele) ->
        $scope.$apply ->
          if ele.value
            $timeout( ->
              $state.go 'output', {inputFolder: ele.value}
            1000
            )
          return
    )
    .state 'output',
      url: '/output?inputFolder'
      templateUrl: 'partials/output.html'
      controller: ($scope,$state,$stateParams,$timeout) ->
        $scope.createReport = (ele) ->
          $scope.$apply ->
            if ele.files.length == 1 and ele.files[0]
              $timeout( ->
                $state.go 'progress', {inputFolder: $stateParams.inputFolder, outputFile: ele.files[0] }
              1000
              )
            return
    .state 'progress',
      url: '/progress?inputFolder&outputFile'
      templateUrl: 'partials/progress.html'
      controller: ($scope,$state,$stateParams,$timeout) ->
        $timeout( 
          ->
            console.log 'input', $stateParams.inputFolder
            console.log 'output', $stateParams.outputFile
          1000
        )
]