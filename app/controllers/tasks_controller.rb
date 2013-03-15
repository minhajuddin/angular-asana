class TasksController < ApplicationController
  respond_to :json

  def index
    respond_with Task.includes(:comments).all.to_json(include: :comments)
  end

  def show
    respond_with Task.find(params[:id])
  end

  def create
    @task = Task.new(params[:task])

    #TODO: how do we handle failures
    @task.save
    respond_with @task

  end

  def update
    @task = Task.find(params[:id])

    #TODO: how do we handle failures
    @task.update_attributes(params[:task])
    params[:comments].each do |comment|
      @task.comments.create comment unless comment[:id]
    end
    #@task.update_attributes(params.except(:id, :created_at, :updated_at, :action, :controller))
    respond_with @task
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    #TODO: how do we handle failures
    respond_with @task
  end
end
