class Post < ApplicationRecord

  has_many :photos, :inverse_of => :post, :dependent => :destroy
  has_many :likes
  belongs_to :user

  accepts_nested_attributes_for :photos, allow_destroy: true

  delegate :profile_image, :name, to: :user, prefix: true

  scope :latest, -> { order(created_at: :desc) }
end
