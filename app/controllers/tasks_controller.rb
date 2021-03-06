class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = current_user.tasks.all
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  def new
    @task = current_user.tasks.new    
  end

  def create
    @task = current_user.tasks.create!(params[:task])
    respond_to do |format|
       format.html { redirect_to root_url }
       format.js
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])
    @task.update_attributes!(params[:task])
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end
  
  
end
