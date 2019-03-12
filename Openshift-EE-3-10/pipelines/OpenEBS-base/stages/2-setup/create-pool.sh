#!/bin/bash
set -x
pod() {
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip 'git clone https://github.com/openebs/e2e-openshift.git'

sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip 'cd e2e-openshift && git checkout rigorous && bash Openshift-EE-3-10/pipelines/OpenEBS-base/stages/2-setup/create-pool.sh node '"'$CI_JOB_ID'"''

}

node() {

job_id=$(echo $1)

#pooling over previous job to complete
echo "*******Creating cstor-pool**************"
bash Openshift-EE-3-10/utils/pooling jobname:s2-j2-policies
bash Openshift-EE-3-10/utils/e2e-cr jobname:s2-j3-cstor-pool jobphase:Running
sleep 30
bash Openshift-EE-3-10/utils/e2e-cr jobname:s2-j3-cstor-pool jobphase:Completed

}

if [ "$1" == "node" ];then
  node $2
else
  pod
fi
