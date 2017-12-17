class Invoice < ApplicationRecord
  belongs_to :property
  belongs_to :tenant


  def month_period
    (self.date.strftime("%B %Y"))
  end

  def total
    (self.property.rent.to_i + self.property.charges.to_i)
  end
end

