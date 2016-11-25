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
  @trainers = Trainer.all()
  erb(:new)
end