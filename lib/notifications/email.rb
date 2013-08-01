module Notifications
  class SubclassMustOverride < StandardError; end

  class Email

    attr_reader :data
    def initialize(data)
      @data = data
    end

    def to
      @to ||= data.fetch("email")
    end

    def name
      @name ||= data.fetch("name")
    end

    def subject
      raise SubclassMustOverride.new("Implement `subject`, please.")
    end

    def template_name
      raise SubclassMustOverride.new("Implement `template_name`, please.")
    end

    def template_dir
    end

    def body
      ERB.new(template).result binding
    end

    def template
      File.read(template_path)
    end

    def template_dir
      './lib/notifications/email/templates'
    end

    def template_path
      File.join(template_dir, "#{template_name}.erb")
    end

    def ship
      Pony.mail(to: to, subject: subject, body: body)
    end
  end
end

require 'notifications/email/purchase_confirmation'
require 'notifications/email/signup_confirmation'
