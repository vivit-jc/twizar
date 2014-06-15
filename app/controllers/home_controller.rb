# encoding: utf-8

class HomeController < ApplicationController
  def index
    @members = []
    return unless(current_user)
    @members = current_user.characters
  end

  def tweet
    begin
      twitter_client.update("R.I.P. #{current_user.characters.first.name} #twizar")
    rescue
      flash[:alert] = "#{$!}"
    else
      current_user.characters.first.destroy
      flash[:notice] = "tweet succeed"
    end
    redirect_to root_path
  end

  def add_status
    err = Character.find_by(user_id: current_user.id, name: params[:name]).statusup(params[:st].intern)
    flash[:alert] = "経験値が足りません" if(err.class == Symbol)
    redirect_to root_path
  end

  def add_member
    begin
      account = twitter_client.user?(params[:account])
    rescue
      flash[:alert] = "#{$!}"
      redirect_to root_path
      return
    end

    if(!account)
      flash[:alert] = "そのアカウントは存在しません"
    elsif(Character.find_by(name: params[:account]))
      flash[:alert] = "そのアカウントは既に所属しています"
    elsif(current_user.guild.member_limit <= current_user.characters.size)
      flash[:alert] = "ギルドの所属上限に達しています"
    else
      c = current_user.characters.create(name: params[:account])
      c.init
    end
    redirect_to root_path
  end

  private
  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = Settings.twitter.consumer_key
      config.consumer_secret     = Settings.twitter.consumer_secret
      config.access_token        = current_user.token
      config.access_token_secret = current_user.secret
    end
  end

end

