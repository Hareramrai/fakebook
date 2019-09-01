class User < ApplicationRecord
  include Omniauthable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  validates :first_name, :last_name, presence: true

  has_many :posts
  has_many :likes

  scope :logged_in_users, -> { where(logged_in: true) }

  def name
    "#{first_name} #{last_name}"
  end
  
  def profile_image
    profile_picture || 'human.png'
  end
end
