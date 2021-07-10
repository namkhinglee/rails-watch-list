class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  validates :comment, length: {
    minimum: 6,
    too_short: "must have at least 6 characters"
  }
  validates :list, uniqueness: { scope: :movie }
end
