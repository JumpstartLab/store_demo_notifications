require './test/test_helper'

class PurchaseConfirmationTest < Minitest::Test

  def data
    data = {
      "name" => "Alice Smith",
      "email" => "alice@example.com",
      "items" => [
        {
          "title" => "Li Hing Mui Lollypops",
          "quantity" => 3
        }
      ],
      "total" => 12.00
    }
  end

  attr_reader :email

  def setup
    @email = Notifications::PurchaseConfirmation.new(data)
  end

  def test_subject
    assert_equal "Thanks for your purchase!", email.subject
  end

  def test_body
    body = <<-BODY
Dear Alice Smith,

Thanks so much for your purchase of:


  3 x Li Hing Mui Lollypops


We've processed your payment for $12.00.

We hope you stop by again!
Frank's Monsterporium
    BODY
    assert_equal body.chomp, email.body.chomp
  end
end
