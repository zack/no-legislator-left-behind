class BillCosponsor < ApplicationRecord
  validates_presence_of :bill_id
  validates_presence_of :legislator_id
end
