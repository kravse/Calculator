app = angular.module("myApp", [])

app.controller "myController",['$scope', ($scope) ->
  
  $scope.calc = "0"
  equation = []
  chain = ''
  operators = ['/', '*', '+', '-', '=', 'C']
  currentValue = ''
  moveOn = false

  $scope.compute = (value)->
    
    if moveOn
      $scope.calc = value
      moveOn = false
    if $scope.isOperator(value) 
      if equation.length < 1 && chain == ''
        $scope.calc = 0
      else 
        equation.push(chain)
        equation.push(value)          
        chain = ''
        moveOn = true
        if(equation.length > 2)
          $scope.calc = $scope.calculate(equation) 
    else
      chain = String(chain) + String(value)
      $scope.calc = chain

  $scope.isOperator = (value)-> 
    operators = ['/', '*', '+', '-', '=', 'C']
    isOperator = false
    
    for i in [operators.length-1..0] by -1
      if value == operators[i]
        isOperator = true
        break

    return isOperator

    # equation.push(value)
    # lastVal = value
    # $scope.calc = value

  $scope.calculate = (value)->
    answer = ''
    
    if value.length < 3
      return
        
    switch String(value[1])
      
      when '*' then answer = parseInt(value[0]) * parseInt(value[2])
      
      when '/' then answer = parseInt(value[0]) * parseInt(value[2])
      
      when '+' then answer = parseInt(value[0]) * parseInt(value[2])

      when '-' then answer = parseInt(value[0]) * parseInt(value[2])

      else 
        answer = 'err!'
    
    # chain = answer
    # temp = equation[4]
    # equation = []
    # equation.push(answer).push(temp)

    return answer
]