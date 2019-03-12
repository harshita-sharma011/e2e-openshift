#!/bin/bash
set -x

pod() {
echo $CI_JOB_ID
###clone e2e-openshift-repo
echo "cloning e2e-openshift repo*************"
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip 'git clone https://github.com/openebs/e2e-openshift.git'
sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$ip 'cd e2e-openshift && git checkout rigorous && bash Openshift-EE-3-10/pipelines/OpenEBS-base/stages/2-setup/deploy-openebs.sh node '"'$CI_JOB_ID'"''
}

node() {
job_id=$(echo $1)

echo "*****Deploying openebs*******"

bash Openshift-EE-3-10/utils/e2e-cr jobname:s2-j1-openebs-deploy jobphase:Running 
bash Openshift-EE-3-10/utils/e2e-cr jobname:s2-j2-policies jobphase:Waiting
bash Openshift-EE-3-10/utils/e2e-cr jobname:s2-j3-cstor-pool jobphase:Waiting
sleep 30
bash Openshift-EE-3-10/utils/e2e-cr jobname:s2-j1-openebs-deploy jobphase:Completed

}

#"$@"

if [ "$1" == "node" ];then
  node $2
else
  pod
fi
