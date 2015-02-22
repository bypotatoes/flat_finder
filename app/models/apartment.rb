class Apartment < ActiveRecord::Base

  validates :eid, :price, :rent_type, presence: true

  validates_uniqueness_of :eid
end
