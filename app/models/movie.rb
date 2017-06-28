class Movie < ApplicationRecord
  validates :name, :genre, :actors, :presence => true
  has_many :reviews
end
