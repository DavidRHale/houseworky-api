class CompletedTasksController < ApplicationController

  def index
    @completed_tasks = CompletedTask.all
    json_response(@completed_tasks)
  end

end
