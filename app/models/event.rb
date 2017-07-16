class Event < ApplicationRecord
  default_scope { order(created_at: :DESC) }
  belongs_to :host, :class_name => "User"

  has_many :attendances
  has_many :users, through: :attendances

  validates :title, presence: true
  validates :description, presence: true
  validates :starts_at, presence: true

  scope :upcoming, -> { where("starts_at > ?", Time.now) }
  scope :past,     -> { where("starts_at < ?", Time.now) }
end
