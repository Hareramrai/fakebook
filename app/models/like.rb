class Like < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :user, counter_cache: true

  def like_or_unlike!
    if persisted?
      destroy
    else
      save!
    end 
  end
end
