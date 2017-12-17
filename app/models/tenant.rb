class Tenant < ApplicationRecord
 belongs_to :property
 has_many :invoices
end
