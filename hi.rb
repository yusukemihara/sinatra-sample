require 'haml'
require 'sinatra'

set :bind, '0.0.0.0'
set :public_folder, File.dirname(__FILE__) + '/static'

get '/' do
  @time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
  haml :index
end

get '/hi' do
  "Que sera sera"
end

get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params[:name] is 'foo' or 'bar'
  "Hello #{params[:name]}!"
end

get '/wareki' do
  haml :wareki
end

post '/wareki' do
  seireki = params['seireki'].to_i
  STDERR.puts seireki
  if seireki < 1868
    @wareki = "知らんよ"
  elsif seireki < 1912 # meiji
    @wareki = "明治#{seireki - 1868 + 1}年"
  elsif seireki < 1926 # taisho
    @wareki = "大正#{seireki - 1912 + 1}年"
  elsif seireki < 1989 # showa
    @wareki = "昭和#{seireki - 1926 + 1}年"
  else                 # heisei
    @wareki = "平成#{seireki - 1988}年"
  end
  haml :wareki_kekka
end
