require "sinatra"
require "sinatra/reloader"

get("/square/new") do
  erb(:square_form)
end

get("/square/results") do
  @number = params["number"].to_f
  @square = @number ** 2
  erb(:square_form_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do 
  @user_number = params["user_number"].to_f
  @square_root = @user_number ** 0.5
  erb(:square_root_results)
end

get("/payment/new") do 
  erb(:payment_form)
end

get("/payment/results") do
  apr = params["user_apr"].to_f
  years = params["user_years"].to_i
  principal = params["user_pv"].to_f

  r = apr / 100 / 12

  n = years * 12

  @apr = apr
  @years = years
  @principal = principal

  @payment = r * principal / (1 - (1 + r)**-n)

  erb(:payment_results)
end

get("/random/new") do
  erb(:random_form)
end

get("/random/results") do
  @min = params["user_min"].to_f
  @max = params["user_max"].to_f
  @random = rand(@min...@max) 
  erb(:random_results)
end 
