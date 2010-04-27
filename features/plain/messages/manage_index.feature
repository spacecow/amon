@allow-rescue
Scenario: Non-admin cannot see list of messages
When I go to the messages page
Then I should be redirected to the root page

Scenario: View list of messages
Given I am logged in as admin
When I go to the admin messages page
Then I should see "Messages" as title
	And I should see "List of messages" as subtitle
