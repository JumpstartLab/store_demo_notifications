require './test/test_helper'

class FakeEmail < Notifications::Email

  def stuff
    @data["stuff"]
  end

  def subject
    "Fake stuff"
  end

  def template_name
    'fake'
  end

  def template_dir
    './test/fixtures'
  end
end

class EmailTest < Minitest::Test

  def data
    {
      "name" => "Alice Smith",
      "email" => "alice@example.com",
      "stuff" => "KITTENS",
    }
  end

  def test_recipient
    assert_equal "alice@example.com", Notifications::Email.new(data).to
  end

  def test_subject
    assert_equal "Fake stuff", FakeEmail.new(data).subject
  end

  def test_body
    assert_equal "Oh, look: KITTENS!".chomp, FakeEmail.new(data).body.chomp
  end

  def test_ship_it
    FakeEmail.new(data).ship # verify in mailcatcher
  end

end
