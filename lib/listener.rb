$:.unshift File.expand_path("./../../lib", __FILE__)
require 'notifications'
require 'json'
require 'redis'
redis = Redis.new(port: 6383)

redis.subscribe("email_notifications") do |event|
  event.message do |channel, body|
    puts body
    body = JSON.parse(body)
    case body["type"]
    when "purchase_confirmation"
      Notifications::PurchaseConfirmation.new(body["data"]).ship
    when "signup_confirmation"
      Notifications::SignupConfirmation.new(body["data"]).ship
    end
  end
end
