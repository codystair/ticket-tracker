class Tag < ApplicationRecord
  has_many :ticket_tags
  has_many :tickets, through: :ticket_tags

  validates :name, presence: true

  scope :alphabetical, -> { order('tags.name ASC') }

  scope :with_counts, -> {
    left_outer_joins(:ticket_tags).select("tags.*, COUNT(ticket_tags.id)").
      group("tags.id")
  }
end
