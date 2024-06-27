class Restaurant < ApplicationRecord
  belongs_to :location
  belongs_to :cuisine

  validates :name, presence: true

  scope :active, -> { where(deactivated_at: nil) }

  def active?
    deactivated_at.blank?
  end
end
