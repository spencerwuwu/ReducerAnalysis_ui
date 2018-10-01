class PagesController < ApplicationController
  before_action :task_params

  def index
    @people = Person.all()
    @contact = Person.where(:is_contact => true)
  end

  def try
    if (params.has_key?(:id))
      @benchmark = Testcase.find(params[:id])
    else
      @benchmark = Testcase.find(1)
    end
    @java = @benchmark.java.gsub "\n", "\\n"
    @java.gsub "\"\t", "\\t"
    @java.gsub "\"", "\\\""
    @java.gsub "\'", "\\\'"
  end

  def create_task
    @task = Testcase.new()
    @task.java = params[:java]
    @task.t1 = params[:t1]
    @task.t2 = params[:t2]
    @task.t3 = params[:t3]
    @task.t4 = params[:t4]
    @task.r_type = params[:r_type]
    respond_to do |format|
      if @task.handle_task
        format.json { render json: @task }
      end
    end
  end

  def benchmarks
    @githubs = Testcase.where(:source => "Github")

    @selfs = Testcase.where(:source => "Self")
  end

  def get_print
    @benchmarks = Testcase.all()
    @benchmarks.each do |b|
      puts "b = Testcase.find(#{b.id})"
      puts "b.comment = \"#{b.comment}\""
      puts "b.source = \"#{b.source}\""
      puts "b.save"
    end
  end

  def task_params
    #params.require(:testcase).permit(:java)
  end
end
