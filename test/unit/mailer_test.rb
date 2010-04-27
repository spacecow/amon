require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "message" do
    @expected.subject = 'Mailer#message'
    @expected.body    = read_fixture('message')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Mailer.create_message(@expected.date).encoded
  end

end
