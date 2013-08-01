module Notifications
  class SignupConfirmation < Email
    def subject
      "Welcome to Frank's Monsterporium!"
    end

    def template_name
      'signup_confirmation'
    end
  end
end
