class Property < ApplicationRecord
  belongs_to :landlord
  has_many :invoices, dependent: :destroy
  has_one :tenant


  def receivable
    (self.rent.to_i + self.charges.to_i)
  end

end
