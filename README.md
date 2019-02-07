

# Microsoft Machine Learning Server Samples and Solutions

**Microsoft Machine Learning Server** supports R and Python deployments on Windows, Linux and Hadoop. See the [Machine Learning server documentation](https://docs.microsoft.com/en-us/machine-learning-server/install/r-server-install-supported-platforms) for more information about supported platforms.

Microsoft Machine Learning Services brings the compute to the data by allowing R or Python to run on the same computer as the database. It includes the Trusted Launchpad service, which runs outside the SQL Server process and communicates securely with the R or Python runtime.

Use the MSDN Forum [Microsoft Machine Learning Server]( https://social.msdn.microsoft.com/Forums/en-US/home?forum=MicrosoftR) for questions about ML Server. If you have questions about the samples and solutions, please open an issue in the relevant repository.

This repository serves as a landing page for you to more easily find the samples and solutions in other repositories. Please create a pull request if you have a repository you'd like to add to this list.

## Samples
The following repositories contain sample code for you to try.

| Repository | Description |
|---|---|
| [Microsoft/SQL-Server-R-Services-Samples](https://github.com/Microsoft/SQL-Server-R-Services-Samples) | Samples on how to use SQL Server ML Services with R. |
| [Microsoft/ML-Server-Python-Samples](https://github.com/Microsoft/ML-Server-Python-Samples) | Python Samples for ML Server |
| [Microsoft/microsoft-r](https://github.com/Microsoft/microsoft-r) | Operationalization and the MicrosoftML package  |

## Solutions
They may contain multiple languages and/or platform code.

| Solution |  Industry | Documentation / Description | SQL Server | HDInsight Spark Cluster | Languages |
|---|---|--|--|--|--|
|[Campaign Optimization](https://github.com/Microsoft/r-server-campaign-optimization) |  Retail<br/>Finance<br/>Services |[Website](https://microsoft.github.io/r-server-campaign-optimization/) |     :white_check_mark:|:white_check_mark:| R |
|[Customer Churn](https://github.com/Microsoft/SQL-Server-R-Services-Samples/blob/master/Churn)|Retail<br/>Finance<br/>Services|Being able to predict when a customer is likely to churn helps retain them.|:white_check_mark:||R|
|[Energy Demand Forecasting](https://github.com/Microsoft/SQL-Server-R-Services-Samples/blob/master/EnergyDemandForecasting)|Energy<br/>Utilities|Forecast electricity demands for multiple regions.|:white_check_mark:||R|
|[Fraud Detection](https://github.com/Microsoft/r-server-fraud-detection) |  Retail<br/>Finance<br/>Services|[Website](https://microsoft.github.io/r-server-fraud-detection/) | :white_check_mark:| :white_check_mark:  | R |
|[Galaxy Classification](https://github.com/Microsoft/SQL-Server-R-Services-Samples/blob/master/Galaxies)|Research|This template shows how to use deep learning and image data to classify galaxies.|
|[Length of Stay](https://github.com/Microsoft/r-server-hospital-length-of-stay) | Healthcare |  [Website](https://microsoft.github.io/r-server-hospital-length-of-stay/) | :white_check_mark:| | R, Python |
|[Image Similarity](https://github.com/Microsoft/ml-server-image-similarity) | Not industry specific | [Website](https://microsoft.github.io/ml-server-image-similarity/) | :white_check_mark:| | Python |
|[Loan ChargeOff Prediction](https://github.com/Microsoft/r-server-loan-chargeoff) |  Finance | [Website](https://microsoft.github.io//r-server-loan-chargeoff/) |   :white_check_mark:| :white_check_mark:  | R |
|[Loan Credit Risk](https://github.com/Microsoft/r-server-loan-credit-risk) |  Finance|[Website](https://microsoft.github.io/r-server-loan-credit-risk/) | :white_check_mark:| :white_check_mark: | R |
|[Predictive Maintenance (1)](https://github.com/Microsoft/SQL-Server-R-Services-Samples/blob/master/PredictiveMaintenance)|Manufacturing|Predict machine failures before they happen, to minimize down time, reduce costs and increase productivity. This template is comparable to the other Predictive Maintenance template. The problem is approached differently.|:white_check_mark:||R|
|[Predictive Maintenance (2)](https://github.com/Microsoft/SQL-Server-R-Services-Samples/blob/master/PredictiveMaintenanceModelingGuide)|Manufacturing|Predicting machine failures before they happen. This template is comparable to the other Predictive Maintenance template. The problem is approached differently.|:white_check_mark:||R|
|[Product Cross Sell](https://github.com/Microsoft/SQL-Server-R-Services-Samples/blob/master/ProductCrossSell)|Retail<br/>Finance<br/>Services|Demonstrates how to develop and deploy end-to-end customer cross-sell prediction models.|:white_check_mark:||R|
|[Resume Matching](https://github.com/Microsoft/SQL-Server-R-Services-Samples/blob/master/SQLOptimizationTips)|Recruiting|This template focuses on optimizing the performance of machine learning solutions integrated with SQL Server by demonstrating how we can find the best candidates for a job opening among millions of resumes within a few seconds.| :white_check_mark:||R|
|[Retail Forecasting](https://github.com/Microsoft/SQL-Server-R-Services-Samples/blob/master/RetailForecasting)|Retail|Predicting the product sales for a retail store helps reduce warehousing cost and save time.|:white_check_mark:||R|
|[Text Classification](https://github.com/Microsoft/ml-server-text-classification) |Not industry specific |  [Website](https://microsoft.github.io/ml-server-text-classification/) |   :white_check_mark:| | R, Python |

# Contributing

Please create a pull request if you have a repository you'd like to add to this list. 

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

# Legal Notices

Microsoft and any contributors grant you a license to the Microsoft documentation and other content
in this repository under the [Creative Commons Attribution 4.0 International Public License](https://creativecommons.org/licenses/by/4.0/legalcode),
see the [LICENSE](LICENSE) file, and grant you a license to any code in the repository under the [MIT License](https://opensource.org/licenses/MIT), see the
[LICENSE-CODE](LICENSE-CODE) file.

Microsoft, Windows, Microsoft Azure and/or other Microsoft products and services referenced in the documentation
may be either trademarks or registered trademarks of Microsoft in the United States and/or other countries.
The licenses for this project do not grant you rights to use any Microsoft names, logos, or trademarks.
Microsoft's general trademark guidelines can be found at http://go.microsoft.com/fwlink/?LinkID=254653.

Privacy information can be found at https://privacy.microsoft.com/en-us/

Microsoft and any contributors reserve all others rights, whether under their respective copyrights, patents,
or trademarks, whether by implication, estoppel or otherwise.
