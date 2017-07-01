class Movie < ApplicationRecord
  validates :name, :genre, :actors, :presence => true
  has_many :reviews
  scope :sort_by_alpha, -> {order(:name)}
  # scope :sort_by_alpha, -> {order(name: :desc)}
  scope :most_recent, -> { order(created_at: :desc).limit(10)}

  scope :most_reviews, -> {(
    select("movies.name, movies.id, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("movies.id")
    .order("reviews_count DESC")
    .limit(5)
    )}

end
