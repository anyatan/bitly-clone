#require 'byebug'
require_relative '../models/url'

get '/' do
	@urls = Url.last
	erb :"static/index"
end

post '/urls' do
	x = Url.new(long_url: params[:long_url])
	x.shorten
	x.save!
	redirect to '/'
end 

get '/:short_url' do 
	y = Url.find_by(short_url: params[:short_url])
	y.click_count += 1
	y.save
	redirect to "#{y.long_url}"
end
