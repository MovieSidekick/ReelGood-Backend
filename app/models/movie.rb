class Movie < ActiveRecord::Base
  self.inheritance_column = nil

  validates :imdb_id, presence: true
  validates_uniqueness_of :imdb_id, message: "Movie already exists."
  validates :title,   presence: true

  has_many :reviews
  has_many :reviewers, through: :reviews, source: :user
end

## has_many :reviews assumes ...
# there is a reviews table in the database
# there is a Review model
# the reviews table has a movie_id column

## has_many :users, through: :reviews assumes ...
# that the above has_many :reviews association exists
# the reviews table *also* has a user_id column
# there is a users table
# there is a User model
