# require 'surveyor'
# require 'rails'
module Surveyor
  class Engine < ::Rails::Engine  
    # Add a load path for this specific Engine
    config.autoload_paths << File.join(config.root, "lib")
#    config.autoload_paths << File.expand_path("../../lib")
#    engine_name :surveyor

    rake_tasks do 
      load File.join(File.dirname(__FILE__), "../tasks/surveyor_tasks.rake")
    end

 end
end
