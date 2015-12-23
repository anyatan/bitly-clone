 #require 'byebug'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	# services.each_with_index do |service, i| next_service = services[i+1] begin return try_get_service_short_url(long_url, service, options) rescue ShortenerOutOfTriesError =&gt; e 
	# out of tries can be logged in a file here end end def try_get_service_short_url(long_url, service, options) options = {:incremental_backoff =&gt; false, :retry_count =&gt; 3, :timeout =&gt; config.timeout}.merge(options) timeout = options[:timeout].to_i retry_count = options[:retry_count] incremental_backoff = options[:incremental_backoff] tries = 0 errors = [] begin return get_service_short_url(long_url, service, timeout) rescue ShortenerValidationError =&gt; e # give long url back if validation failed raise ShortenerValidationError, e.message if e.instance_of?(ShortenerValidationError) rescue Exception =&gt; e # log raise ShortenerOutOfTriesError.new(e.message, errors) if e.instance_of?(ShortenerHourlyLimitError) raise ShortenerOutOfTriesError.new("Retries count exceeded (#{retry_count})", errors) if (tries += 1) &gt; retry_count sleep(2**tries) if tries &gt; 1 &amp;&amp; incremental_backoff retry end end 
	#attr_accessor :url
	#attr_reader :url

# another method to display the short url is 
# def save
# 	Url.create(long_url: params [:long_url], short_url: self.short_url)
# end

	def shorten
		set = Array('A'..'Z') + Array('a'..'z') + Array('1'..'10')
		@code = Array.new(5){ set.sample }.join
		self.short_url = "#{@code}"
	end
end
	# def self.generate(number)
	# 	# url = "http://localhost:9393/@code"
	# 	#code = "whatisthis"
	# 	set = Array('A'..'Z') + Array('a'..'z') + Array('1'..'10')
	# 	@code = Array.new(number){ set.sample }.join
	# end

#Url.shorten("http://www.acunetix.com/websitesecurity/web-applications/")



