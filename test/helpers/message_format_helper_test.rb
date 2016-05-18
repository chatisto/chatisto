require 'test_helper'

class MessageFormatHelperTest < ActiveSupport::TestCase
  include MessageFormatHelper

  test "links in text" do
    assert_equal("<a href=\"https://google.com\" target=\"_blank\">https://google.com</a>",
                 format_message("https://google.com"))
  end

  test "emojis in text" do
    assert_equal("<img alt=\":smile:\" src=\"/images/emoji/unicode/1f604.png\" style=\"vertical-align:middle\" width=\"18\" height=\"18\" title=\":smile:\">",
                 format_message(":smile:"))
  end

  test "links and emojies in text" do
    assert_equal("wow, this <a href=\"https://medium.com\" target=\"_blank\">https://medium.com</a> link is awesome <img alt=\":+1:\" src=\"/images/emoji/unicode/1f44d.png\" style=\"vertical-align:middle\" width=\"18\" height=\"18\" title=\":+1:\">",
                 format_message("wow, this https://medium.com link is awesome :+1:"))
  end
end
