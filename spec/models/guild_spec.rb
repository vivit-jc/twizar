# encoding: utf-8

require 'rails_helper'

RSpec.describe Guild do
  before do
    @guild = FactoryGirl.create(:guild)
  end

  it "名声によって解禁されたダンジョンIDの配列を返す" do
    expect(@guild.unlocked_dungeons.size).to eq(2)
  end
end
