require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

# http://jdfrens.blogspot.com/2010/08/upgrading-to-rails-3-and-rspec-2-part_20.html
# RSPEC-RAILS 2.4.1 IS BROKEN! 
# https://github.com/rspec/rspec-rails/tree/v2.4.1
describe "surveyor/show.html.haml" do
  before(:each) do
    @survey = Factory(:survey, :title => "xyz", :access_code => "xyz", :sections => [Factory(:survey_section)])  
    @survey.sections.first.questions=Array.new(3) {Factory(:question)}
    template.stub!(:next_number).and_return(1)
  end

  it "should render _question partial,if question is not part of a question_group" do
    @survey.sections.first.questions.each{|q| q.stub(:part_of_group?).and_return(false)}
    assigns[:survey] = @survey
    expect_render_partial_calls('question', 3)
  end

  it "should render _question_group partial for a group of questions" do
    question_group = Factory.create(:question_group)
    # Assosciate all questions with the question_group
    @survey.sections.first.questions.each{|q| q.question_group = question_group}
    assigns[:survey] = @survey
    expect_render_partial_calls('question_group', 1)
  end

  def expect_render_partial_calls(partial_name, num_calls)
    # Excpection regaring calls to render :partial

#    template.should_receive(:render).exactly(num_calls).times.with(hash_including(:partial => "partials/#{partial_name}")).ordered
    #debugger
    # template.should_receive(:render_.with(:partial => "partials/#{partial_name}")
    render 
    #"surveyor/show"
    view.should render_template(:partial => "partials/_#{partial_name}", :count => num_calls)
  end


end
