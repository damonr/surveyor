require 'rails/generators'
module Surveyor
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)
    desc "Generate surveyor README, migrations, assets and sample survey"
    class_option :skip_migrations, :type => :boolean, :desc => "skip migrations, but generate everything else"
    
    def readme
      copy_file "../../../../README.md", "surveys/README.md"
    end
    def migrations     
      unless options[:skip_migrations]
        # because all migration timestamps end up the same, causing a collision when running rake db:migrate
        # copied functionality from RAILS_GEM_PATH/lib/rails_generator/commands.rb
        %w(create_surveys create_survey_sections create_questions create_question_groups create_answers create_response_sets create_responses create_dependencies create_dependency_conditions create_validations create_validation_conditions add_display_order_to_surveys add_correct_answer_id_to_questions add_index_to_response_sets add_index_to_surveys add_unique_indicies add_section_id_to_responses).each_with_index do |model, i|
          unless (prev_migrations = Dir.glob("db/migrate/[0-9]*_*.rb").grep(/[0-9]+_#{model}.rb$/)).empty?
            prev_migration_timestamp = prev_migrations[0].match(/([0-9]+)_#{model}.rb$/)[1]
          end
          copy_file("migrate/#{model}.rb", "db/migrate/#{(prev_migration_timestamp || Time.now.utc.strftime("%Y%m%d%H%M%S").to_i + i).to_s}_#{model}.rb")
        end
      end
    end
    def assets
      # directory "public"
      copy_dir('public/images', 'public/images/surveyor')
      copy_dir('public/javascripts', 'public/javascripts/surveyor')
      copy_dir('public/stylesheets', 'public/stylesheets/surveyor')

      copy_file "public/stylesheets/sass/surveyor.sass", "public/stylesheets/sass/surveyor.sass"

    end
    def surveys
      create_file "surveys/fixtures/.gitkeep"
      copy_file "surveys/kitchen_sink_survey.rb"
    end
    def locales
      directory "config/locales"
    end

  private

  #source dir is relative to the template dir target_dir relative to the rails root
  def copy_dir(source_dir, target_dir = nil)
    target_dir = source_dir if target_dir.nil?
    Dir.new(File.join(InstallGenerator.source_root , source_dir)).entries.each do |file_name|
      file = File.join(source_dir, file_name)
      file_full_path = File.join(InstallGenerator.source_root, file)
      # debugger if file.include? "images"
      copy_file file, "#{target_dir}/#{file_name}" unless File.directory?(file_full_path)
    end
  end

  end
end
