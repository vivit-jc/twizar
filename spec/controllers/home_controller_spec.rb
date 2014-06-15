# encoding: utf-8

require 'rails_helper'

RSpec.describe HomeController do

  before do
    @user = FactoryGirl.create(:user)
    controller.stub(:current_user) { @user }
    @user.characters.create(name: "vivit_jc").init
    @user.characters.create(name: "shuzo_kino").init
  end

  describe "index" do
    it "responds successfully with an HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "ログインしていなければメンバーはゼロ" do
      controller.stub(:current_user) {nil}
      get :index
      expect(assigns(:members).size).to eq(0)
    end

    it "正しい冒険者を持っている" do
      get :index
      expect(assigns(:members).size).to eq(2)
      expect(assigns(:members)[0].name).to eq("vivit_jc")
    end

    it "ユーザーの名声に合わせてダンジョンの入口が示される" do
      get :index
      expect(assigns(:dungeons).size).to be(2)
      expect(assigns(:dungeons_disabled).size).to be(2)
    end

    it "ダンジョン攻略中なら道中画面にリダイレクト" do
      @user.status.dungeon = 1
      @user.status.floor = 1
      get :index
      expect(response).to redirect_to(action: :dungeon)
    end

  end

end
