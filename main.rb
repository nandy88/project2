     
require 'sinatra'
require 'sinatra/reloader' if development?
# also_reload 'models/dish.rb' if development?
# also_reload 'models/user.rb' if development?
require 'pry'
require 'pg'
# require_relative 'models/dish.rb'
# require_relative 'models/user.rb'

enable :sessions

get '/' do

  erb :index
end

get '/signup' do

  erb :signup
end

get '/login' do

  erb :login
end

get '/captain_questions' do

  erb :captain_questions
end

get "/captain_select" do

  erb :captain_select
end

get "/logout" do

  erb :logout
end

get "/close_account" do

  erb :close_account
end







