class Room < ActiveRecord::Base
  include UrlHelper

  scope :marked_public, -> { where(marked_public: true) }
  scope :ordered, -> { order(:name) }

  def self.generate
    create(name: Haikunator.haikunate)
  end

  def url
    url_generator.room_url(name)
  end
end
