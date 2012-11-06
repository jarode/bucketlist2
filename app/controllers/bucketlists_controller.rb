class BucketlistsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def create
    @bucketlist = current_user.bucketlists.create(params[:bucketlist])
    if @bucketlist.save
      flash[:success] = "Bucket item created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @bucketlist.destroy
    redirect_to root_path
  end

  private

    def correct_user
      @bucketlist = current_user.bucketlists.find_by_id(params[:id])
      redirect_to root_path if @bucketlist.nil?
    end
end