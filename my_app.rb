
require 'rubygems'
require 'sinatra'
require 'httparty'
require 'cgi'
load 'config/init.rb'

# Quick test
get '/' do
  haml :index
end

get '/cache' do
  raise 401 unless params[:key] == 'secret_kod_key'
  headers['Cache-Control'] = 'public, max-age=604800'
  url = CGI::unescape(params[:url])
  HTTParty.get(url)
end

