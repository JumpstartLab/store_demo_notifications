require 'pony'
require 'erb'

require 'notifications/email'

module Notifications

  def self.answer
    42
  end

  Pony.options = {
    :from => 'noreply@example.com',
    :via => :smtp,
    :via_options => {:address => "localhost", :port => 1025}
  }
end
