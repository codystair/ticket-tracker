class Ticket < ApplicationRecord
  STATUSES = %w(new blocked in_progress fixed)

  belongs_to :project
  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true

  has_many :ticket_tags
  has_many :tags, through: :ticket_tags

  validates :name, presence: true
  validates :status, inclusion: { in: STATUSES }
  validates :project_id, presence: true

  scope :open, -> { where("status != ?", "fixed") }
end
