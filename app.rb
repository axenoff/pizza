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

	@orders_input = params[:orders]
	@items = parse_orders_input @orders_input

	@items.each do |item|
		item[0] = Product.find(item[0])
	end

	@o=Order.new


	erb :cart
end

def parse_orders_input orders_input

s1= orders_input.split(/, /)

arr=[]

s1.each do |x|
    s2 = x.split(/=/)
    
    s3 = s2[0].split(/_/)
    
    id = s3[1]
    cnt = s2[1]
    
    arr2 = [id, cnt]
    arr.push arr2
end

return arr

end

post '/place_order' do
@products = Product.all

	@o = Order.create params[:order ]

	if @o.save
		erb :order_placed
	else
		@error = @o.errors.full_messages.first
	end

end

get '/orders' do
	@orders=Order.all
	erb :orders
end

# ДЗ:
# post '/cart' do
# 	@orders_pre = params[:orders]
# 	@orders_f=@orders_pre.split
# 	@orders={}
# 	@orders_f.each do |o|
# 		@b=o.split('=')
# 		@c = @b[0].split('_')
# 		@key=@c[1].to_i
# 		@value = @b[1].to_i
# 		@orders[@key]=@value

# 	end
# 	@products = Product.all

# 	erb :cart

# end
	
# post '/order' do
# 	@products = Product.all

# 	@o = Order.new params[:order ]

# 	if @o.save
# 		erb "<h2>New order added</h2>"
# 	else
# 		@error = @o.errors.full_messages.first
# 	end

# end
