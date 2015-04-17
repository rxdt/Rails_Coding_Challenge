class TasksController < ApplicationController
  before_action :get_project, only: [:new, :edit]

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
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to project_path(get_project)
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :difficulty, :project_id)
  end

  def get_project
    @project = Project.find(params[:project_id])
  end
end