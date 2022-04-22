require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require './models/item.rb'

get '/' do
    @items = Item.all
    @total = Item.sum(:price)
    erb :index
end

post '/create' do
    Item.create({
        title: params[:title],
        price: params[:price]
    })
    
    redirect '/'
end