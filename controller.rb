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

get '/trainer/new' do
  erb(:new_trainer)
end

get '/trainer' do
  @trainers = Trainer.all()
  erb(:trainer_index)
end

get '/trainer/:id' do
  @trainer = Trainer.find(params[:id])
  erb(:show_trainer)
end

post '/trainer' do
  trainer = Trainer.new(params)
  trainer.save()
  redirect to("/trainer")
end

get '/adopt' do
  @trainers = Trainer.all()
  @pokemon = Pokemon.all()
  erb(:adopt)
end

post '/adopt' do
  Pokemon.update(params)
  redirect to ("/thankyou")
end

get '/thankyou' do
  erb(:thankyou)
end