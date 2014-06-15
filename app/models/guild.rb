class Guild < ActiveRecord::Base
  belongs_to :user

  def member_limit
    CONF[:guild_limit].size.times do |i|
      return i+3 if(CONF[:guild_limit][i] > self.fame)
    end
  end
end
