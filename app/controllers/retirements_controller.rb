class RetirementsController < ApplicationController
  def new
  end

  def create
    if current_user.destroy
      reset_session # ((1))
      redirect_to root_path, notice: "退会完了しました"
    end
  end
end
