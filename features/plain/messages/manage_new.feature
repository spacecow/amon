Scenario: View form
When I go to the new message page
Then I should see "Contact me" as title
	And I should see "Fill in the contact form"

Scenario: Create a message
When I go to the new message page
	And I fill in "Name" with "Test Name"
	And I fill in "Email" with "space@dot.com"
	And I fill in "Company" with "My company"
	And I fill in "Phone" with "1234"
	And I fill in "Subject" with "A subject"
	And I fill in "Message" with "A test message"
	And I press "Send"
Then I should be redirected to the root page
	And I should see "Thanks for your message." as notice flash message
	And a message should exist with name: "Test Name", email: "space@dot.com", company: "My company", phone: "1234", subject: "A subject", body: "A test message"