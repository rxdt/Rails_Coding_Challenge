class TasksController < ApplicationController
  before_action :get_project
  before_action :get_task, only: [:edit, :update, :destroy]

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to project_path(get_project)
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to project_path(get_project)
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to project_path(get_project) }
      format.json { head :no_content }
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :difficulty, :project_id)
  end

  def get_project
    @project = Project.find(params[:project_id])
  end

  def get_task
    @task = Task.find(params[:id])
  end
end