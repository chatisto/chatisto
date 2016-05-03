require 'test_helper'

class ManageRoomsTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.javascript_driver = :poltergeist
    Capybara.current_driver = Capybara.javascript_driver # :selenium by default
  end

  teardown do
    Capybara.use_default_driver
  end

  test "login to a room" do
    room = rooms(:rough_winter)
    visit room_path(id: room.name)
    assert_equal "Login to #{room.name}", find("h1").text
    # enter invalid name (less than 4 characters)
    fill_in "Choose a username", with: "no"
    find("#login-submit").click
    # should not pass, stay on same site
    assert_equal "Login to #{room.name}", find("h1").text
    fill_in "Choose a username", with: "jack.sparrow"
    find("#login-submit").click

    # wait for ajax response (turbolinks visit)
    find("#room-title")

    assert_equal room.name, find("h1").text
    ActionCable.server.broadcast "room_channel_#{room.name}", username: "tester", message: "this is a message"
  end
end
