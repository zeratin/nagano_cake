class Address < ApplicationRecord

  belongs_to :customer

  def address_name
    self.postal_code + self.address + self.name
  end
  def full_name
    name
  end

end
