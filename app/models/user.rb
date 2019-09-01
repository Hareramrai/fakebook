class User < ApplicationRecord
  include Omniauthable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  validates :first_name, :last_name, presence: true

  has_many :posts

  def name
    "#{first_name} #{last_name}"
  end
  
  def profile_image
    profile_picture || 'human.png'
  end
end
