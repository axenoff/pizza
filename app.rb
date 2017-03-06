#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzeria.db"

class Product < ActiveRecord::Base

end

get '/' do
	@products = Product.all
	erb :index
end

get '/about' do
	erb :about
end
