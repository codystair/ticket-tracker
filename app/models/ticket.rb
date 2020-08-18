class Ticket < ApplicationRecord
  STATUSES = %w(new blocked in_progress fixed)

  belongs_to :project

  has_many :ticket_tags
  has_many :tags, through: :ticket_tags

  validates :name, presence: true
  validates :status, inclusion: { in: STATUSES }
  validates :project_id, presence: true
end
