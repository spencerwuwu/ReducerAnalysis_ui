class PagesController < ApplicationController
  #before_action :task_params

  def index
    # for description
    @current = Person.where(:is_current => true)
    @former = Person.where(:is_current => false) 
    @contact = Person.where(:is_contact => true)


    # for editor benchmark list
    @selfs = Testcase.where(:source => "Self")
    @b2018 = Testcase.where(:source => "2018")
    #@b2017 = Testcase.where(:source => "2017")

    # for editor
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
      else
        format.json { head :no_content }
      end
    end
  end

  def load_benchmark
    @benchmark = Testcase.find(params[:id])
    @java = @benchmark.java.gsub "\n", "\\n"
    #@java.gsub "\"\t", "\\t"
    #@java.gsub "\"", "\\\""
    #@java.gsub "\'", "\\\'"
    #@benchmark.java = @java

    respond_to do |format|
        format.json { render json: @benchmark }
    end
  end

  def benchmarks
    @selfs = Testcase.where(:source => "Self")
    @b2018 = Testcase.where(:source => "2018")
    #@b2017 = Testcase.where(:source => "2017")
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

end
