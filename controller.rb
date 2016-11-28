require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/pokemon')
require_relative('models/trainer')

get '/' do
  erb(:home)
end

get '/pokemon' do
  @pokemon = Pokemon.all()
  erb(:index)
end

get '/pokemon/new' do
  erb(:new)
end

get '/pokemon/:id' do
    @pokemon = Pokemon.find(params[:id])
    erb(:show)
  end

post '/pokemon' do
  pokemon = Pokemon.new(params)
  pokemon.save()
  redirect to("/pokemon")
end