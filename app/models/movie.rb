class Movie < ApplicationRecord
  validates :name, :genre, :actors, :presence => true
  has_many :reviews
  scope :sort_by_alpha, -> {order(:name)}
  # scope :sort_by_alpha, -> {order(name: :desc)}
  scope :most_recent, -> { order(created_at: :desc).limit(10)}
end
