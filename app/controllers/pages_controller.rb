class PagesController < ApplicationController
  before_action :task_params
  def index
  end

  def try
  end

  def create_task
    @task = Testcase.new()
    @task.java = params[:java]
    @task.t1 = params[:t1]
    @task.t2 = params[:t2]
    @task.t3 = params[:t3]
    @task.t4 = params[:t4]
    @task.type = params[:type]
    @task.compile_error = 0
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
