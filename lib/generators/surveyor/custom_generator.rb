require 'rails/generators'
module Surveyor
  class CustomGenerator < Rails::Generators::Base
    source_root File.expand_path("../../extend_surveyor/templates", __FILE__)
    
    def readme
      copy_file "EXTENDING_SURVEYOR.md", "surveys/EXTENDING_SURVEYOR.md"
    end
    def controller
      copy_file "extensions/surveyor_controller.rb", "app/controllers/surveyor_controller.rb"
    end
    def layout
      copy_file "extensions/surveyor_custom.html.erb", "app/views/layouts/surveyor_custom.html.erb"
    end
    
  end
end
