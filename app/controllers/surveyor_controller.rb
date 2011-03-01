require 'surveyor'
# Surveyor Controller allows a user to take a survey. It is semi-RESTful since it does not have a concrete representation model.
# The "resource" is a survey attempt/session populating a response set.
class SurveyorController < ApplicationController
  unloadable
  include Surveyor::SurveyorControllerMethods
  @@DEBUG = false
  def self.toggle_debug
    @@DEBUG = !@@DEBUG
  end
  def self.debug?
    @@DEBUG
  end
end
