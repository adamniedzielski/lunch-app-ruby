class Restaurant < ApplicationRecord
  belongs_to :location
  belongs_to :cuisine

  validates :name, presence: true
end
