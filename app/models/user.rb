class User < ApplicationRecord
  has_many :events, :foreign_key => "host_id", :class_name => "Event"

  before_save :downcase_email, :capitalize_name
  validates :email, presence: true
  validates :name, presence: true

private

  def downcase_email
    self.email = email.downcase
  end

  def capitalize_name
    self.name = name.split.each { |w| w.capitalize! }.join(" ")
  end
end
