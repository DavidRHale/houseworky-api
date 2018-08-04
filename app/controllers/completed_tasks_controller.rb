class CompletedTasksController < ApplicationController
  before_action :set_completed_task, only: [:show]

  def index
    @completed_tasks = CompletedTask.all
    json_response(@completed_tasks)
  end

  def show
    json_response(@completed_task)
  end

  def create
    @completed_task = CompletedTask.create!(completed_task_params)
    json_response(@completed_task, :created)
  end

  private

  def set_completed_task
    @completed_task = CompletedTask.find(params[:id])
  end

  def completed_task_params
    params.permit(:title, :room, :created_by)
  end

end
