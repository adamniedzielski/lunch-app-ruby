class Location < ApplicationRecord
  has_many :restaurants, dependent: :destroy
end
