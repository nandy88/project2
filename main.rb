     
require 'sinatra'
require 'sinatra/reloader' if development?
also_reload 'models/dish.rb' if development?
also_reload 'models/user.rb' if development?
require 'pry'
require 'pg'
require_relative 'models/captain.rb'
require_relative 'models/user.rb'

enable :sessions

def logged_in?

  if session["user_id"]
    
    return true
  
  else 
    
    return false
  
  end
end

def current_user
  
  return find_one_user_by_id(session["user_id"])
end

get '/' do

  erb :index
end

get '/login' do

  erb :login
end

post '/users' do
  create_user(params["name"], params["email"], params["username"], params["password"])

  redirect '/login'
end

post '/user_inputs' do

  redirect '/captain_select'
end

get '/signup' do

  erb :signup
end

post '/session' do 

  user = find_one_user_by_username(params["username"])

  if user && BCrypt::Password.new(user["password_digest"]) == params["password"]

    session["user_id"] = user["id"]

    redirect "/captain_questions"

  else

    erb :login
  
  end

end

get '/captain_questions' do
  return "Get out of here" unless logged_in?

  user = find_one_user_by_id(session["user_id"]) 
  # binding.pry
  # user is a hash of all user keys and values user[captain_id]
#  user = {
#    "id" => "1",
#    "captain_id" => "7"
#  }
  if  user['captain_id']

      captain = find_one_captain_by_id(user['captain_id'])

      erb :captain_select, locals: { captain: captain }
  else

    erb :captain_questions
  end

end

get '/new_session' do

  erb :new_session
end

get "/captain_select" do
  return "Get out of here" unless logged_in?

  captain = find_random_captain

  assign_captain(captain['id'], session["user_id"])

  erb :captain_select, locals: { captain: captain }
end

get "/logout" do

  erb :logout
end

get "/close_account" do
  return "Get out of here" unless logged_in?

  erb :close_account
end

delete '/session' do

  session["user_id"] = nil

  redirect "/logout"
end

delete '/edit' do

  destroy_user(session["user_id"])

  session["user_id"] = nil

  redirect "/"
end



