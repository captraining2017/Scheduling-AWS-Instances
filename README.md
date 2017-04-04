# Scheduling-AWS-Instances

Tools Used: Jenkins
AWS cli
Source code: Shell Script

Created start and stop jobs in jenkins.
Build and schedule jobs
1. Build requires arguments such as Environment tag value, region and an exception list.
2. Instances you want to start/stop in which region and tagged for which environment. Exception list enables you to exclude the instances    tagged in that region from the start/stop job.
3. Select build periodically to schedule the start/stop instances jobs.
4. Build output will show the instance ids.
