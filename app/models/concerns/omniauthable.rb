module Omniauthable
  extend ActiveSupport::Concern

  class_methods do

    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email 
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.profile_picture = auth.info.image

        user.token = auth.credentials.token
        user.expires = auth.credentials.expires
        user.expires_at = auth.credentials.expires_at
        user.refresh_token = auth.credentials.refresh_token
        user.password = Devise.friendly_token[0,20]
        user.logged_in = true 
      end
    end
  end
end