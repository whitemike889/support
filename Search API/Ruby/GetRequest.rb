require 'net/https' # This uses the standard net/https gem.
require 'uri'

url = "ENTER_API_URL_HERE"
user = "ENTER_USERNAME_HERE"
pass = "ENTER_PASSWORD_HERE"

rule = '(snow OR rain) profile_region:co'

uri = URI.parse(url)

uri.query = "query=#{URI.encode(rule)}&maxReults=100"

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Get.new(uri.request_uri)
request.basic_auth(user, pass)

begin
    response = http.request(request)
rescue
    sleep 5
    response = http.request(request) #try a second time... 
end

puts response.body # prints data to stdout.


