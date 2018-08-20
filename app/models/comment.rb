class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    validates :score, numericality: true,less_than_or_equal_to: 100 && greater_than_or_equal_to: 0
    validates :text, presence: true, unless: :score?
end
