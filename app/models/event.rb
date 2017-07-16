class Event < ApplicationRecord
  default_scope { order(created_at: :DESC) }
  belongs_to :host, :class_name => "User"

  validates :title, presence: true
  validates :description, presence: true
  validates :starts_at, presence: true
end
