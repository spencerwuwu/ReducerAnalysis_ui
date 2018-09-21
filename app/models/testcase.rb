class Testcase < ApplicationRecord

  def handle_task
    path = APP_CONFIG['scriptPath']

    File.open(path + "reducer.java", 'w') { |file| file.write(self.java) }

    compile_cmd = path + "compile.py " + self.t1 + " " + self.t2 + " " + self.t3 + " " + self.t4 + " " + self.type + " " 

    puts compile_cmd + path
    self.compile = %x{ #{compile_cmd + path} }

    if self.compile != nil and self.compile.length != 0
      self.compile_error = 1
      return true
    end

    self.execute = %x{ #{path + "run_execute.py " + path} }
    self.jimple = %x{ #{path + "run_jimple.py " + path} }
    self.checker = %x{ #{"cd " + path + " && ./run_checker.py ./"} }
    return true
  end

end
