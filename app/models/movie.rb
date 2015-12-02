class Movie < ActiveRecord::Base
  self.inheritance_column = nil

  validates :imdb_id, presence: true
  validates_uniqueness_of :imdb_id, message: "Movie already exists."
  validates :title,   presence: true
end
