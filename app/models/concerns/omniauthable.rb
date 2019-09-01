module Omniauthable
  extend ActiveSupport::Concern

  class_methods do

    def from_omniauth(auth)
      where(email:  auth.info.email).first_or_initialize.tap do |user|
        user.email           = auth.info.email 
        user.first_name      = auth.info.first_name
        user.last_name       = auth.info.last_name
        user.profile_picture = auth.info.image

        user.provider        = auth.provider
        user.uid             = auth.uid
        user.token           = auth.credentials.token
        user.expires         = auth.credentials.expires
        user.expires_at      = auth.credentials.expires_at
        user.refresh_token   = auth.credentials.refresh_token
        user.password        = Devise.friendly_token[0,20]
        user.logged_in       = true 
        user.save!
      end
    end
  end
end