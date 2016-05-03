namespace :rooms do
  desc "clear all rooms which are not used one day ago"
  task :clear => :environment do
    Room.where(marked_public: false).where("updated_at < :day", day: 1.day.ago).delete_all
  end
end
