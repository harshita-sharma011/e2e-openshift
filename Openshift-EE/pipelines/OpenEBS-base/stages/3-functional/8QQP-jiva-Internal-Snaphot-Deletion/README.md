### 8QQP-Verify Jiva-Internal-Snapshot Deletion

#### Description

This test ensures that the Jiva Internal Snaphot get Deleted.
#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva based storage class should be present.

#### Procedure

- This job triggers the litmus experiments which restarts jiva replicas to create internal snapshots.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This litmus experiment creates 15 internal snaphots by restrating the replicas.
- Finally, it checks if the snapshot is getting deleted.

#### Expected result

- The number intenal snapshots presend should be less that 11.

#### Test Result
| Job ID |   Test Description         | Execution Time |Test Result   |
 |---------|---------------------------| --------------|--------|
 |    <a href="https://gitlab.openebs.ci/openebs/e2e-openshift/-/jobs/84964">84964</a>   |  Verify if the snapshot is getting Deleted Automatically           |  Wed Sep 11 10:51:17 IST 2019     |<a href="https://e2e-logs.openebs100.io/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-7d,mode:quick,to:now))&_a=(columns:!(_source),filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:commit_id,negate:!f,params:(query:'b76569aecb665661857726a2feceb05d85029548',type:phrase),type:phrase,value:'b76569aecb665661857726a2feceb05d85029548'),query:(match:(commit_id:(query:'b76569aecb665661857726a2feceb05d85029548',type:phrase)))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:cluster-logs,key:pipeline_id,negate:!f,params:(query:'3209',type:phrase),type:phrase,value:'3209'),query:(match:(pipeline_id:(query:'3209',type:phrase))))),index:cluster-logs,interval:auto,query:(language:lucene,query:''),sort:!('@timestamp',desc))">Fail</a>  |