class User < ActiveRecord::Base
  has_many :characters
  has_one  :guild

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.screen_name = auth['info']['nickname']
      user.name = auth['info']['name']
      user.token = auth['credentials']['token']
      user.secret = auth['credentials']['secret']
    end
  end
  def update_keys(auth)
    self.token = auth['credentials']['token']
    self.secret = auth['credentials']['secret']
    self.save
  end
end