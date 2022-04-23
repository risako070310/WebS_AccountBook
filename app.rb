require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require './models/item.rb'

get '/' do
    @items = Item.all
    @total = Item.sum(:price)
    @categories = Category.all
    erb :index
end

post '/create' do
    Item.create({
        title: params[:title],
        price: params[:price],
        category_id: params[:category]
    })
    
    redirect '/'
end

get '/category/:id' do
    @categories = Category.all
    @category = Category.find(params[:id])
    @category_name = @category.name
    @items = @category.items
    erb :index
end