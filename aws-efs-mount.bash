#!/usr/bin/bash

# aws-efs-mount.bash

# This program replaces the (AWS) Elastic File System (EFS)
# metadata directory method used when I was addressing the
# IPv6 only workaround for git before putting my public git
# repos on GitLab that can be accessed with IPv6 as well as IPv4

# The first section uses the REGION environment variable
# to set the unique file system ID for the LAM VPC EFS
# for that region.

case ${REGION} in

  af-south-1)
    EFS=fs-0efb2a6616ad77e76.efs.af-south-1.amazonaws.com
    ;;

  ap-east-1)
    EFS=fs-07b8bea7d36fbd423.efs.ap-east-1.amazonaws.com
    ;;

  ap-northeast-1)
    EFS=fs-0055911a273d2036c.efs.ap-northeast-1.amazonaws.com
    ;;

  ap-northeast-2)
    EFS=fs-02d7c10d8f355782c.efs.ap-northeast-2.amazonaws.com
    ;;

  ap-northeast-3)
    EFS=fs-0eabb3afc0fcafaf0.efs.ap-northeast-3.amazonaws.com
    ;;

  ap-south-1)
    EFS=fs-08e7b5179413223f5.efs.ap-south-1.amazonaws.com
    ;;

  ap-south-2)
    EFS=fs-0f3c49954793b0430.efs.ap-south-2.amazonaws.com
    ;;

  ap-southeast-1)
    EFS=fs-0bc20791f1e218e75.efs.ap-southeast-1.amazonaws.com
    ;;

  ap-southeast-2)
    EFS=fs-052b468ab85811127.efs.ap-southeast-2.amazonaws.com
    ;;

  ap-southeast-3)
    EFS=fs-0235fe95dd1a70c55.efs.ap-southeast-3.amazonaws.com
    ;;

  ap-southeast-4)
    EFS=fs-0994e5fd7ba4fc589.efs.ap-southeast-4.amazonaws.com
    ;;

  ap-southeast-5)
    EFS=fs-097997ec94e6b5581.efs.ap-southeast-5.amazonaws.com
    ;;

  ap-southeast-7)
    EFS=fs-0cdd71000ba1a3219.efs.ap-southeast-7.amazonaws.com
    ;;

  ca-central-1)
    EFS=fs-097d1db7b352a4500.efs.ca-central-1.amazonaws.com
    ;;

  ca-west-1)
    EFS=fs-07ec130e68a08c1f5.efs.ca-west-1.amazonaws.com
    ;;

  eu-central-1)
    EFS=fs-04e350b9678ec7514.efs.eu-central-1.amazonaws.com
    ;;

  eu-central-2)
    EFS=fs-02f9285fc8f4641d1.efs.eu-central-2.amazonaws.com
    ;;

  eu-north-1)
    EFS=fs-01ac02b17de17c958.efs.eu-north-1.amazonaws.com
    ;;

  eu-south-1)
    EFS=fs-0e556fc5b3f845477.efs.eu-south-1.amazonaws.com
    ;;

  eu-south-2)
    EFS=fs-07b7207cb5cdb0fc8.efs.eu-south-2.amazonaws.com
    ;;

  eu-west-1)
    EFS=fs-0674ed15d7c1778ee.efs.eu-west-1.amazonaws.com
    ;;

  eu-west-2)
    EFS=fs-0825e9a369572f872.efs.eu-west-2.amazonaws.com
    ;;

  eu-west-3)
    EFS=fs-0d87e55159aed8001.efs.eu-west-3.amazonaws.com
    ;;

  il-central-1)
    EFS=fs-00330568057577874.efs.il-central-1.amazonaws.com
    ;;

  me-central-1)
    EFS=fs-0d20d1b5a09698f87.efs.me-central-1.amazonaws.com
    ;;

  me-south-1)
    EFS=fs-070ebe5207ef277ec.efs.me-south-1.amazonaws.com
    ;;

  sa-east-1)
    EFS=fs-0ad6de574706f8e5c.efs.sa-east-1.amazonaws.com
    ;;

  us-east-1)
    EFS=fs-08390e7e2f64fa292.efs.us-east-1.amazonaws.com
    ;;

  us-east-2)
    EFS=fs-076bd139f4c16a023.efs.us-east-2.amazonaws.com
    ;;

  us-west-1)
    EFS=fs-00596c6c130ced74d.efs.us-west-1.amazonaws.com
    ;;

  us-west-2)
    EFS=fs-6f45fac6.efs.us-west-2.amazonaws.com
    ;;

# If we do not know the EFS for the REGION we exit as an error.

  *)
    echo "Unknown EFS for REGION=${REGION}" >&2
    exit 1
    ;;

esac

echo "REGION=${REGION} EFS=${EFS}"

# Mount the EFS using nfsv4

nfsOpt="_netdev,noresvport,nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 0 0"

mkdir /mnt/efs
echo "${EFS}:/ /mnt/efs nfs4 ${nfsOpt}" >> /etc/fstab
systemctl daemon-reload
mount -a -t nfs4
df -Th -x supermount --exclude-type=tmpfs --exclude-type=devtmpfs
