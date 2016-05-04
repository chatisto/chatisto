require 'test_helper'

class ManageRoomsTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.javascript_driver = :poltergeist
    Capybara.current_driver = Capybara.javascript_driver # :selenium by default
  end

  teardown do
    Capybara.use_default_driver
  end

  test "full chat usecase" do
    room = rooms(:rough_winter)
    visit room_path(id: room.name)
    assert_equal "Login to #{room.name}", find("h1").text
    # enter invalid name (less than 4 characters)
    login_with_username("no")
    # should not pass, stay on same site
    assert_equal "Login to #{room.name}", find("h1").text

    login_with_username("my.username")

    # wait for ajax response (turbolinks visit)
    find("#room-title")

    assert_equal room.name, find("h1").text
    assert_empty all("#room-messages li")

    # wait for websocket to connect
    sleep 2

    # simulate tester writing a message
    ActionCable.server.broadcast("room_channel_#{room.name}",
                                 username: "tester",
                                 message: "this is a message")
    # wait for actioncable to process chat message
    sleep 3

    assert_messages("tester: this is a message")

    # write and submit message
    send_message("wow, this chat app is awesome!")

    assert_messages("tester: this is a message",
                    "my.username: wow, this chat app is awesome!")

    # change username
    click_on 'my.username'

    # wait for turbolinks visit to finish
    find("#login-title")

    login_with_username("my.new.username")

    send_message("wow, I just renamed myself!")

    assert_messages("my.new.username: wow, I just renamed myself!")
  end

  def send_message(message)
    fill_in "message-input", with: message
    find("form#message-input-form button[type=submit]").click
    sleep 3
  end

  def login_with_username(username)
    fill_in "Choose a username", with: username
    find("#login-submit").click
  end

  def assert_messages(*messages)
    assert_equal messages, all("#room-messages li").map(&:text)
  end
end
