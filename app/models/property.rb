class Property < ApplicationRecord
  belongs_to :landlord
  has_many :tenants, dependent: :destroy

end
