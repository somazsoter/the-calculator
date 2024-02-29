class CalculatorController

  def calculate(user_input)
    match_obj = user_input.match(/^(\d+)([-+*\/])(\d+)$/)
    return "Error: input must be two integers with a valid operator (+-*/)" if match_obj.nil?
    
    calculate_result(match_obj)
  end

  def calculate_result(match_obj)
    num1 = match_obj[1].to_i
    operator = match_obj[2]
    num2 = match_obj[3].to_i

    case operator
    when '+'
      num1 + num2
    when '-'
      num1 - num2
    when '*'
      num1 * num2
    when '/'
      num1.fdiv(num2).round(2)
    end
  end
end
