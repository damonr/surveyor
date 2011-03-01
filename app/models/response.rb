class Response < ActiveRecord::Base
  unloadable
  include ActionView::Helpers::SanitizeHelper
  include Surveyor::Models::ResponseMethods

  validates_uniqueness_of :answer_id, :scope => [:question_id, :response_set_id]
 
end
