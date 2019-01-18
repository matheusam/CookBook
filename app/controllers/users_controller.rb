class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show]

    def edit
      #beybug
    end

    def update
      #beybug
      if @user.update(user_params)
        redirect_to user_path
      else
        render :edit
      end
    end

    def show
      #beybug
   end

    private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:photo)
    end
end
