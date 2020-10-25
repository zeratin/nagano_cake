class Address < ApplicationRecord
  def address_name
    self.postal_code + self.address + self.name
  end

end
