require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/pokemon')
require_relative('models/trainer')

get '/' do
  erb(:home)
end