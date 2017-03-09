#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzeria.db"

class Product < ActiveRecord::Base

end

class Order < ActiveRecord::Base
	validates :order, presence: true
	validates :name, presence: true
	validates :phone, presence: true
	validates :adress, presence: true
end

get '/' do
	@products = Product.all
	erb :index
end

get '/about' do
	erb :about
end

post '/cart' do
	@orders_pre = params[:orders]
	@orders_f=@orders_pre.split
	@orders={}
	@orders_f.each do |o|
		@b=o.split('=')
		@c = @b[0].split('_')
		@key=@c[1].to_i
		@value = @b[1].to_i
		@orders[@key]=@value

	end
	@products = Product.all

	erb :cart

end
	
post '/order' do
	@products = Product.all

	@o = Order.new params[:order]

	if @o.save
		erb "<h2>New order added</h2>"
	else
		@error = @o.errors.full_messages.first
	end

end
