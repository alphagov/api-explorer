require 'open-uri'

use Rack::Static, 
  :urls => ["/css", "/img", "/js"],
  :root => "public"

run lambda { |env|
  request = Rack::Request.new(env)
  if request.path.match(/^\/api\/(.*)/)
    uri_to_fetch = "https://www.gov.uk/#{$1}"
    uri_to_fetch += "?q=#{request.params['q']}" if request.params['q']
    body = open(uri_to_fetch)
  else
    body = File.open('public/index.html', File::RDONLY)
  end

  [
    200, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=86400' 
    },
    body
  ]
}