class Testcase < ApplicationRecord

  def handle_task
    path = APP_CONFIG['scriptPath']

    File.open(path + "reducer.java", 'w') { |file| file.write(self.java) }
    cmd = path + "j-ReCoVer " + self.t1 + " " + self.t2 + " " + self.t3 + " " + self.t4 + " " + self.r_type

    self.result = %x{ #{cmd} }
    if self.result.include? "Usage: ./j-ReCoVer"
      self.result = "Type Error"
    end
    return true
  end

end
