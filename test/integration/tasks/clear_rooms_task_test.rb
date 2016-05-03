require 'test_helper'

class ClearRoomsTaskTest < ActiveSupport::TestCase
  test "clear all rooms which are last updated 1 day ago or later" do
    old_room_name = "i-am-out-of-date-123"
    Room.create(name: old_room_name,
                created_at: Time.new(2015),
                updated_at: Time.new(2016))
    Rake::Task["rooms:clear"].invoke
    assert_nil Room.find_by(name: old_room_name)
  end
end
