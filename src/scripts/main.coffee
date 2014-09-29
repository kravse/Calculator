app = angular.module("myApp", [])

app.controller "myController",['$scope', ($scope) ->
  
  $scope.calc = "0"
  equation = []
  chain = ''
  operators = ['/', '*', '+', '-', '=']
  currentValue = ''
  moveOn = false

  $scope.compute = (value)->
    if value is 'C'
      $scope.reset(true)
      return

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
    operators = ['/', '*', '+', '-', '=']
    isOperator = false
    
    for i in [operators.length-1..0] by -1
      if value == operators[i]
        isOperator = true
        break

    return isOperator


  $scope.calculate = (value)->
    
    answer = ''

    if value.length < 3
      return
        
    switch String(value[1])
      
      when '*' then answer = parseInt(value[0]) * parseInt(value[2])
      
      when '/' then answer = parseInt(value[0]) / parseInt(value[2])
      
      when '+' then answer = parseInt(value[0]) + parseInt(value[2])

      when '-' then answer = parseInt(value[0]) - parseInt(value[2])

      else 
        answer = 'err!'
    
    $scope.reset(false)

    if(value[3] is '=')
      equation.push(answer)
      chain = answer
    else
      equation.push(answer)
      equation.push(value[3])

    return answer

  $scope.reset = (zero)->
    chain = ''
    equation = []
    
    if(zero)
      $scope.calc = 0
]