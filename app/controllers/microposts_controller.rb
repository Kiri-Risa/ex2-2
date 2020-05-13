class MicropostsController < ApplicationController
    before_action :logged_in_check, only: [:create, :destroy]
    before_action :user_check,   only: :destroy

    def create
      @micropost = current_user.microposts.build(micropost_params)
      if @micropost.save
        flash[:success] = "Micropost created!"
        redirect_to root_url
      else
        flash.now[:error] = "Failed to create Micropost"
        @feed_items = []
        render 'static_pages/home'
      end
    end
  
    def destroy
      if @micropost.destroy
        flash[:success] = "Micropost deleted"
        redirect_to request.referrer || root_url
      else
        flash.now[:error] = "Failed to delete Micropost"
        @feed_items = []
        render 'static_pages/home'
      end
    end
  
    private
  
      def micropost_params
        params.require(:micropost).permit(:content, :picture)
      end

      def user_check
        @micropost = current_user.microposts.find_by(id: params[:id])
        redirect_to root_url if @micropost.nil?
      end
  end