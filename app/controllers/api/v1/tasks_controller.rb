class Api::V1::TasksController < ApplicationController
  def index
    @tasks = Task.all
    render json: @tasks, status: 200
  end

  def create
    @task = Task.create(task_params)
    render json: @task, status: 201
  end

  def destroy
    task = Tark.find(params[:id])
    if task.destroy
      render json: {taskId: task.id}, status: 200
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      render json: @task, status: 200
    end
  end

  private
    def task_params
      params.require(:task).permit(:body)
    end


end
