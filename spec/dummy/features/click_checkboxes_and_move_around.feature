Feature: Click checkboxes and move around

  Scenario: check 2 and move next section and uncheck
    Given the survey
    """
      survey "Favorites" do
        section "First" do
          label "Color question1"
          q_2b "Choose the colors you don't like", :pick => :any
          a_1 "orange"
          a_2 "purple"
          a_3 "brown"
          a :omit
        end
        section "Second" do
          label "Color question2"
          question_1 "What is your favorite color?", :pick => :one
          answer "red"
          answer "blue"
          answer "green"
          answer :other
       end
    """
    When I start the "Favorites" survey
    And I check "orange"
    And I check "brown"
    And I press "Next section"
    And I choose "red"
    And I press "Previous section"
    And I check "brown" 
    And I press "Next section"
    And I press "Finish"
    Then I should not see "Unable to update survey"  
    Then I should see "Completed survey" 
    And there should be 1 response set with 2 responses with: 
      | to_s   |
      | blue   |
      | orange |
 
