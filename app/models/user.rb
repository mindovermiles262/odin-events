class User < ApplicationRecord
  has_many :hosted_events, :foreign_key => "host_id", :class_name => "Event", dependent: :destroy

  has_many :attendances
  has_many :events, through: :attendances

  before_save :downcase_email, :capitalize_name
  validates :email, presence: true
  validates :name, presence: true

  def upcoming_events
    self.events.where("starts_at > ?", Time.now)
  end

  def past_events
    self.events.where("starts_at < ?", Time.now)
  end

private

  def downcase_email
    self.email = email.downcase
  end

  def capitalize_name
    self.name = name.split.each { |w| w.capitalize! }.join(" ")
  end
end
