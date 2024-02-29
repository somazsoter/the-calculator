require_relative 'app/routes/init'

map '/' do
  run HomeRoutes.new
end

map '/calculator' do
  run CalculatorRoutes.new
end
