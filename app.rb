#encoding: utf-8
require 'rubygems'
require 'sinatra'

get '/' do
	erb :index
end

get '/about' do
	erb :about
end
