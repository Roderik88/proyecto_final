class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_initialize do
    if self.new_record?
      self.role ||= :visit
    end
  end

  enum role: [ :admin, :visit]

  has_many :orders
  has_many :products, through: :orders
end
