require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Answer, "when creating a new answer" do
  before(:each) do
    @answer = Factory(:answer, :text => "Red")
  end
  
  it "should be valid" do
    @answer.should be_valid
  end
  
  # this causes issues with building and saving answers to questions within a grid.
  # it "should be invalid without a question_id" do
  #   @answer.question_id = nil
  #   @answer.should_not be_valid
  # end
  
<<<<<<< HEAD
  it "should have 'default' renderer with nil question.pick and response_class" do      
    @answer.question = Factory(:question, :pick => nil)
    @answer.response_class = nil
    @answer.renderer.should == :default
  end
  
  it "should have a_b renderer for a question.pick and B response_class" do
    @answer.question = Factory(:question, :pick => "a")
    @answer.response_class = "B"
    @answer.renderer.should == :a_b
  end
    
=======
  it "should tell me its css class" do
    @answer.custom_class = "foo bar"
    @answer.css_class.should == "foo bar"
    @answer.is_exclusive = true
    @answer.css_class.should == "exclusive foo bar"
  end
  
  it "should hide the label when hide_label is set" do
    @answer.split_or_hidden_text.should == "Red"
    @answer.hide_label = true
    @answer.split_or_hidden_text.should == ""
  end
  it "should split up pre/post labels" do
    @answer.text = "before|after|extra"
    @answer.split_or_hidden_text(:pre).should == "before"
    @answer.split_or_hidden_text(:post).should == "after|extra"
  end
  it "should delete validation when it is deleted" do
    v_id = Factory(:validation, :answer => @answer).id
    @answer.destroy
    Validation.find_by_id(v_id).should be_nil
  end
>>>>>>> a4d08e8fc86623446e2349fe93f6392c4c6fe119
end