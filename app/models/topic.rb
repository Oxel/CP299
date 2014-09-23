class Topic < ActiveRecord::Base
  has_many :posts, :autosave => true

  scope :visible_to, -> (user) { user ? all: where(public: true) && all: where(private: true) }

end
