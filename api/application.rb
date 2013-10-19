# application.rb
require 'sinatra'
require_relative 'models/player'

Mongoid.load!("config/mongoid.yml")
set :bind, '0.0.0.0'
set :post, 4567

get '/' do
  player = Player.new
  player.first_name = "Nicolas"
  player.last_name = "Collard"
  player.save
  "Player #{player.first_name} #{player.last_name} has been save !"
end
