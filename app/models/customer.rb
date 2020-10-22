class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # has_many :items , through: :cart_items, source: :item

  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
