require_relative '../controllers/calculator'

class CalculatorRoutes < Sinatra::Base
  use AuthMiddleware
  
  def initialize
    super
    @calculatorCtrl = CalculatorController.new
  end

  get('/') do
    request = Rack::Request.new(env)
    user_input = request.query_string.gsub('expression=', '')
    { 
      expression: user_input, 
      result: @calculatorCtrl.calculate(user_input)
    }.to_json
  end
end
