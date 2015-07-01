class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost = current_user.microposts.build 
      @feed_items = current_user.feed.paginate(page: params[:page])
      @microposts = current_user.microposts.search(params[:search])
      sleep 1
      @incomplete_tasks = current_user.tasks.where(complete: false)
      @complete_tasks = current_user.tasks.where(complete: true)      
    end  
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
