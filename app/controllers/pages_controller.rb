class PagesController < ApplicationController
  before_action :task_params
  def index
  end

  def try
  end

  def create_task
    @task = Testcase.new()
    @task.java = params[:java]
    respond_to do |format|
      if @task.handle_task
        format.json { render json: @task }
      end
    end
  end

  def benchmarks
  end

  def task_params
    #params.require(:testcase).permit(:java)
  end
end
