class Room < ActiveRecord::Base
  validates :name, uniqueness: true

  scope :marked_public, -> { where(marked_public: true) }
  scope :ordered, -> { order(:name) }

  def self.generate
    generated = new(name: Haikunator.haikunate)
    if generated.save
      generated
    else
      generate
    end
  end
end
