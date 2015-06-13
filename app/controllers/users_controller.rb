class UsersController < ApplicationController
before_filter :signed_in_user, only: [:index, :edit, :show, :update, :destroy]
before_filter :correct_user,   only: [:edit, :update]
before_filter :admin_user, only: :destroy
 
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 7)
  end
  
  def new
    if signed_in?
      redirect_to root_url
      flash[:notice] = "You are already a signed-up user! Yuhuh!"
      else
    @user = User.new
    end
  end
  
  def create
    @user = User.new(params[:user])
    
      if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      else
      render 'new'
      end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Successfully updated"
      sign_in @user
      redirect_to @user 
    else
      render 'edit'
    end
  end
  
  def destroy    
    @user = User.find(params[:id])
      unless @user.admin?  
        @user.destroy
        flash[:messages] ="User destroyed"
      end
    redirect_to root_url
  end
  
  private    
      
      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
      end
      
      def admin_user
        redirect_to(root_url) unless current_user.admin?
      end
end
