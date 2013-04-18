require 'test_helper'

class ForgotTest < ActionMailer::TestCase
  test "pass" do
    mail = Forgot.pass(sdgfsg, lskdf)
    assert_equal "Pass", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["gpismaest@gmail.com"], mail.from
   assert_match "Hi", mail.body.encoded
  end

end
