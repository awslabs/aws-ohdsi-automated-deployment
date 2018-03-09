# Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance with the License. 
# A copy of the License is located at
#    http://aws.amazon.com/apache2.0/
# or in the "license" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
# either express or implied. See the License for the specific language governing permissions and limitations under the License.
#

install.packages("devtools",repos = "http://cran.us.r-project.org")
library(devtools)
install_github("awslabs/aws-ohdsi-automated-deployment", subdir = "SqlRender")
install_github("awslabs/aws-ohdsi-automated-deployment", subdir = "DatabaseConnector")
install_github("awslabs/aws-ohdsi-automated-deployment", subdir = "Achilles")
library(Achilles)
connectionDetails <- createConnectionDetails(dbms="redshift", server="REDSHIFT_ENDPOINT/mycdm", user="master",
                            password='DATABASE_PASSWORD', schema="public", port="5439")
achillesResults <- achilles(connectionDetails, cdmDatabaseSchema="public", 
                            resultsDatabaseSchema="results", sourceName="CMS DE-SynPUF", 
                            cdmVersion = "5", vocabDatabaseSchema="public")