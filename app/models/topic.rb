class Topic < ActiveRecord::Base
  has_many :posts, :autosave => true

  scope :publicly_viewable, -> { where(public: true) }
  scope :privately_viewable, -> { where(public: false) }
  scope :visible_to, -> (user) { user ? all: where(public: true) }

end
