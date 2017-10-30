require 'zoomus'

Zoomus.configure do |c|
  c.api_key = ENV['ZOOMUS_API_KEY']
  c.api_secret = ENV['ZOOMUS_SECRET_KEY']
end
ZoomusClient = Zoomus.new
