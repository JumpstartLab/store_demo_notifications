module Notifications
  class PurchaseConfirmation < Email

    def items
      @data["items"]
    end

    def total
      sprintf("$%.2f", @data["total"])
    end

    def subject
      "Thanks for your purchase!"
    end

    def template_name
      'purchase_confirmation'
    end
  end
end
