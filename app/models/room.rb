require 'digest/sha1'

class Room < ActiveRecord::Base
  include UrlHelper

  scope :marked_public, -> { where(marked_public: true) }
  scope :ordered, -> { order(:name) }

  def self.generate
    name = Digest::SHA1.hexdigest(Time.now.to_f.to_s)[0..5]
    create(name: name)
  end

  def url
    url_generator.room_url(id: name)
  end
end
