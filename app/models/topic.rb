class Topic < ActiveRecord::Base
  has_many :posts, :autosave => true
end
