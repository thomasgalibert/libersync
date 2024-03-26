require "test_helper"

class PaymentMailerTest < ActionMailer::TestCase
  test "notify_owner" do
    mail = PaymentMailer.notify_owner
    assert_equal "Notify owner", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
