class Review < ApplicationRecord
    validates :author, :rating, :content, :presence => true
    belongs_to :movie

    scope :user_write_most_reviews, -> {(
      select("reviews.author, count(*) as author_count")
      .group("reviews.author")
      .order("author_count DESC")
      .limit(5)
      )}

end
