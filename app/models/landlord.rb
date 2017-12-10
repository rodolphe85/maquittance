class Landlord < ApplicationRecord
  has_many :properties, dependent: :destroy
end
