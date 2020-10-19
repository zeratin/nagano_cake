class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

<<<<<<< HEAD

=======
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
>>>>>>> 7759046e1d5e31b1326a64b7ae85a6591bad8f5b
end
