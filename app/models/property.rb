class Property < ApplicationRecord
  belongs_to :landlord
  has_many :tenants, dependent: :destroy

  def receivable
    (self.rent.to_i + self.charges.to_i)
  end

end
