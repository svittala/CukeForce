Scenario:
As an Under writer I should be able to assess value and risk of a building that belongs to a customer

@LocateBuildingData
Given I am at a "Customer X" building site
When I lookup the "Customer X" then
I should be able to locate the building details on my iPad

@AssessBuilding
Given I am at the "Customer X" Building Details for "Building 1"
I should be able to verify the following
|square footage 	| 9800|
|number of floors	| 14 |
|age 				      | 12 |
|safety features	|"Special features"|
|Code Compliance	| "No Vialotions found"|
And I should be able to submit the Asset Documentation to Internal System
And I should be able to initiate Supervisor Approval workflow

@SuperVisorFeedbackReview
Given I receive supervisor feedback on Missing Data
I should be able to review the Supervisor Remarks
And Update the missing fields
|Date of City Inspection| '04\16\2014'|
|Date of FireStation Cert | '04\11\2014'|
And reinitiate the approval workflow

@ReviewApprovedSubmission
Given I receive supervisor Approval on Document Submission
I should be able to Open Risk Assessment Application
And I should be able to view SFDC information in the Risk Assessment System
And I should be able to Initiate Risk Scoring
And I should be able to Initiate Predictive Analysis Scoring
And I should be able to review policy score from Internal system
And I should be able to sign "complete assessment"
And I should be able to initiate Document Transfer to Assessor 

Opens the risk assessment apps to assess risk score based on information submitted. SFDC events trigger risk scoring to a legacy risk scoring engine and submits collected date for scoring of the policy.
Information is used to submit a predictive analytics score.
Information returned over SOA services now helps define a policy and details of that is sent out to the assessor.
UI data collection-> UI events – UI Object updates -> Data Object updates -> Triggers -> Workflow update-> wait for review and approval from supervisor real-time-> assess exceptions and update -> submit -> APEX code -> Direct Database insert/update in legacy system -> submit data to risk scoring module -> reply over API or web services or APEX code
Proceed to next step based on result returned
