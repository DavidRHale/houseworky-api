class CompletedTasksController < ApplicationController
  before_action :set_completed_task, only: [:show]

  def index
    @completed_tasks = CompletedTask.all
    json_response(@completed_tasks)
  end

  def show
    json_response(@completed_task)
  end

  private

  def set_completed_task
    @completed_task = CompletedTask.find(params[:id])
  end

end
