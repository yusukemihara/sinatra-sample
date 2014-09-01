require 'sinatra'

set :bind, '0.0.0.0'
set :public_folder, File.dirname(__FILE__) + '/static'

get '/hi' do
  "Que sera sera"
end

get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params[:name] is 'foo' or 'bar'
  "Hello #{params[:name]}!"
end
