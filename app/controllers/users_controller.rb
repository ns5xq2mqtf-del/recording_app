class UsersController < ApplicationController
  before_action :authenticate_user! # login状態でのみ起こすaction
  before_action :set_user, only: [ :show, :edit, :update, :account ]# = privateのset_user


  def show
    # @user = User.find(params[:id])があるのと同じ。
  end

  def edit
    # @user = User.find(params[:id])だとurlを参照してしまうのでよくない。(書き換えられる)
    # 但しあとがき優先なのでここに書いてあっても(before_setしてても)問題ない。
    # editではその時点での登録情報を吸い上げてる。⇒これから手入力で欄を書き換えて、updateで反映予定。
    @user = current_user
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "- プロフィール情報を更新しました - "
      redirect_to user_path(@user)
    else
      render "users/edit", status: :unprocessable_entity
    end
  end

  def account
      redirect_to root_path unless @user == current_user
  end

  private
  # private以下は外部から実行できない

  def user_params
    params.require(:user).permit(:name, :avatar,)
  end
  # editやcreateでかけてる制限を名付けた上で個別に配置。繰り返し書きたくないので。

  def set_user
    @user = User.find(params[:id])
  end
  # "その"ユーザ(直前に送られてきてるidのユーザ)を変数に入れる。
end
