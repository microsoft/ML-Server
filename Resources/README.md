# Deploying SQL Server ML Services Solutions on a DSVM

The ARM template mainTemplate.json creates a DSVM in Azure and adds one of the seven possible ML Services solutions to the DSVM.

** FIX THE urls BELOW **
<a href='https://portal.azure.com/#blade/Microsoft_Azure_Compute/CreateMultiVmWizardBlade/internal_bladeCallId/anything/internal_bladeCallerParams/{"initialData":{},"providerConfig":{"createUiDefinition":"https%3A%2F%2Fraw.githubusercontent.com%2FMicrosoft%2FML-Server%2Fmarketplace%2FResources%2FcreateUiDefinition.json"}}' target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png" />
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FMicrosoft%2FML-Server%2Fmarketplace%2FResources%2FmainTemplate.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

When deploying mainTemplate.json manually, the value of solutionName must be one of the following:

* campaign
* hospital
* lcrl
* lco
* fraud
* text
* image