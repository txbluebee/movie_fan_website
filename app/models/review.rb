class Review < ApplicationRecord
    validates :author, :rating, :content, :presence => true

    belongs_to :movie
end
