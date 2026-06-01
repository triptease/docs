# Data Feed - Setup Instructions

## How is the data shared?

We use Google BigQuery to share our data with you. This allows us to share data in a secure and scalable way 
but also allows you to decide how fresh you want the data to be.

### Why BigQuery?

BigQuery provides a number of advantages from an integration perspective:
1. BigQuery is natively supported by all major BI tools (e.g. Tableau, Looker, PowerBI, Qlik etc.)
2. Storage and query costs are separate. This allows Triptease to cover all storage costs, while you only pay for the queries you run that are outside the free tier — so you can choose between on-demand or scheduled refreshes of your data.

## What data is available?

See the [Data](/data) page for a full list of available data sources.

## What do you need to get started?

You will need the following:

1. A Google Cloud project where you want the data to be visible
   * You can create a [project here](https://console.cloud.google.com/projectcreate)
2. A Google user account and/or service account that we will share the data with (we just need the email address)
   * If you don't already have a Google Cloud account, you can [sign up for the free tier here](https://cloud.google.com/bigquery/)
   * You can create a [service account here](https://console.cloud.google.com/iam-admin/serviceaccounts) (select your project, then "Create Service Account")

Once you have both, send Triptease the email address of the user and/or service account you want the data shared with. You don't need to grant us any access to your project — we publish the data via Analytics Hub to the account you provide.

NB. Having both a service account and a user account is recommended as it allows you to explore the data as a user and 
then use the service account for automated processes (like BI access).

### Will you be charged by Google?

Google BigQuery has a free tier that allows you to run 1TB of queries per month for free. This should easily cover 
most use cases, including querying the data multiple times a day. If, however, you run complex queries that process most
of your data many times a day, you could start to be charged by Google. In this case you will either want to copy the 
data into your own data warehouse or enable query caching in your BI tool of choice.

## What are the next steps?

Once Triptease has shared the data with your account, you can then follow [this link](https://console.cloud.google.com/bigquery/analytics-hub/exchanges(analyticshub:search)?queryText=triptease)

If prompted click the "ENABLE" button to allow access to Analytics Hub

![enable-analytics-hub.png](assets/images/enable-analytics-hub.png)

Then you should see a listing similar to this

![find-triptease-listing.png](assets/images/find-triptease-listing.png)

Click on the listing and then click "ADD DATA SET TO PROJECT"

![add-data-to-project.png](assets/images/add-data-to-project.png)

Once you have done this you should see a message to "GO TO LINKED DATASET"

![goto-linked-data-set.png](assets/images/goto-linked-data-set.png)

From here you can explore the data and write SQL queries directly in your browser.

![explore-data-set.png](assets/images/explore-data-set.png)

## How do you connect your BI tool?

Once you have set up and tested access in BigQuery, you can use the service account to connect your BI tool of choice to
BigQuery:

### Looker Studio (formerly Google Data Studio)

[Looker Studio setup BigQuery](https://support.google.com/looker-studio/answer/6295968?hl=en)
 

### Looker

[Google Looker Configure BigQuery](https://cloud.google.com/looker/docs/db-config-google-bigquery)

### Tableau

[Tableau Desktop -> Google BigQuery](https://help.tableau.com/current/pro/desktop/en-us/examples_googlebigquery.htm)

### PowerBI

[Microsoft Power BI Google BigQuery Connection](https://learn.microsoft.com/en-us/power-query/connectors/google-bigquery)

### Qlik

[Qlik Create Google BigQuery Connection](https://help.qlik.com/en-US/connectors/Subsystems/ODBC_connector_help/Content/Connectors_ODBC/GoogleBigQuery/Create-GBQ-Connection.htm)

### Pentaho

[Pentaho 9.5 Setup Google BigQuery](https://help.hitachivantara.com/Documentation/Pentaho/Data_Integration_and_Analytics/9.5/Setup/Google_BigQuery)


### Scheduled CSV Export to Bucket

[EXPORT DATA statement](https://cloud.google.com/bigquery/docs/reference/standard-sql/other-statements#export_data_statement)

[Setup Scheduled Query](https://cloud.google.com/bigquery/docs/scheduling-queries)
