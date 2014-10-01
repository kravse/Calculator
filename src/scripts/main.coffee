app = angular.module("myApp", [])

app.controller "myController",['$scope', ($scope) ->
  
  $scope.calc = "0"
  operator = false
  numbers = []
  chain = ''
  operators = ['/', '*', '+', '-', '=']
  currentValue = ''
  moveOn = false

  $scope.compute = (value)->

    if value is 'C'
      $scope.reset(true)
      return

    if $scope.isOperator(value)
      switch numbers.length
        when 0 
          $scope.calc = 0
          operator = false
        when 1 
          operator = value
        when 2 
          $scope.calculate(value)
    else 
      switch numbers.length
        when 0
          numbers.push(value)
          $scope.calc = value
        when 1 
          if operator 
            numbers.push(value)
            $scope.calc = value
          else 
            numbers[0] = String(numbers[0]) + String(value)
            $scope.calc = numbers[0]
        when 2 
          numbers[1] = String(numbers[1]) + String(value)
          $scope.calc = numbers[1]

  $scope.calculate = (op)->
    
    switch String(operator)
          
      when '*' then answer = parseFloat(numbers[0]) * parseFloat(numbers[1])
      
      when '/' then answer = parseFloat(numbers[0]) / parseFloat(numbers[1])
      
      when '+' then answer = parseFloat(numbers[0]) + parseFloat(numbers[1])

      when '-' then answer = parseFloat(numbers[0]) - parseFloat(numbers[1])

      else 
        answer = 'err'

    $scope.calc = answer

    if op 
      operator = op
      numbers = []
      numbers.push(answer)
    else 
      operator = false

  $scope.reset = (zero)->
    operator = false
    numbers = []
    
    if(zero)
      $scope.calc = 0

  $scope.isOperator = (value)-> 
    operators = ['/', '*', '+', '-', '=']
    isOperator = false
    
    for i in [operators.length-1..0] by -1
      if value == operators[i]
        isOperator = true
        break

    return isOperator

]