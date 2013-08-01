require './test/test_helper'

class SignupConfirmationTest < Minitest::Test

  def data
    data = {
      "name" => "Alice Smith",
      "email" => "alice@example.com",
    }
  end

  attr_reader :email

  def setup
    @email = Notifications::SignupConfirmation.new(data)
  end

  def test_subject
    assert_equal "Welcome to Frank's Monsterporium!", email.subject
  end

  def test_body
    body = <<-BODY
Heya Alice Smith,

Thanks for signing up to shop with us! Let us know if we can help with anything at all.

Cheers,
Frank's Monsterporium
    BODY
    assert_equal body.chomp, email.body.chomp
  end
end
