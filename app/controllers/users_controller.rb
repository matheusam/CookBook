class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show]

    def edit; end

    def update
      if @user.update(user_params)
        redirect_to user_path
      else
        render :edit
      end
    end

    def show
      if params
        @user = User.find(params[:id])
      end
   end

    private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(%i[photo name city facebook twitter])
    end
end
