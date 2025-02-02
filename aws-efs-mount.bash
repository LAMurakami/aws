#!/usr/bin/bash

# aws-efs-mount.bash

# This program replaces the (AWS) Elastic File System (EFS) metadata directory
# method used when I was addressing the IPv6 only workaround for git before
# putting my public git repos on GitLab that can be accessed with IPv6 as well
# as IPv4.

# I am now mounting three filesystems as part of initialization for a region.
# efs1 - Standard - All files are always online - All that was available in 2017
# efs2 - With Lifecycle Management - Standard, Infrequent Access, and Archive
# efs3 - One Zone with Lifecycle Management - Standard and Infrequent Access

# efs1 is populated in all regions with a copy of the bash user resources
# archive files needed to complete the initialization.
# The other two filesystems are not required to complete initialization.

# One Zone EFS are not currently supported in all AZs

# The first case section uses the REGION environment variable to set the unique
# file system ID for the LAM VPC EFS for that region.

# The second case section uses the Availability_Zone environment variable to set
# the unique file system ID for the LAM VPC EFS for that Availability_Zone (AZ).

case ${REGION} in

  af-south-1) # Africa (Cape Town)
    EFS=fs-0efb2a6616ad77e76.efs.af-south-1.amazonaws.com
    EFS2=fs-0febee1c1999ee5df.efs.af-south-1.amazonaws.com
    ;;

  ap-east-1) # Asia Pacific (Hong Kong)
    EFS=fs-07b8bea7d36fbd423.efs.ap-east-1.amazonaws.com
    EFS2=fs-0135807df97f2cf6e.efs.ap-east-1.amazonaws.com
    ;;

  ap-northeast-1) # Asia Pacific (Tokyo)
    EFS=fs-0055911a273d2036c.efs.ap-northeast-1.amazonaws.com
    EFS2=fs-0b58add49289f1962.efs.ap-northeast-1.amazonaws.com
    ;;

  ap-northeast-2) # Asia Pacific (Seoul)
    EFS=fs-02d7c10d8f355782c.efs.ap-northeast-2.amazonaws.com
    EFS2=fs-009003d8adbd3493b.efs.ap-northeast-2.amazonaws.com
    ;;

  ap-northeast-3) # Asia Pacific (Osaka)
    EFS=fs-0eabb3afc0fcafaf0.efs.ap-northeast-3.amazonaws.com
    EFS2=fs-0da4c20db8ea93172.efs.ap-northeast-3.amazonaws.com
    ;;

  ap-south-1) # Asia Pacific (Mumbai)
    EFS=fs-08e7b5179413223f5.efs.ap-south-1.amazonaws.com
    EFS2=fs-02abfd66659412fe9.efs.ap-south-1.amazonaws.com
    ;;

  ap-south-2) # Asia Pacific (Hyderabad) (India)
    EFS=fs-0f3c49954793b0430.efs.ap-south-2.amazonaws.com
    EFS2=fs-0cb333b3b0bb96ffa.efs.ap-south-2.amazonaws.com
    ;;

  ap-southeast-1) # Asia Pacific (Singapore)
    EFS=fs-0bc20791f1e218e75.efs.ap-southeast-1.amazonaws.com
    EFS2=fs-02bf11cf21591bd70.efs.ap-southeast-1.amazonaws.com
    ;;

  ap-southeast-2) # Asia Pacific (Sydney)
    EFS=fs-052b468ab85811127.efs.ap-southeast-2.amazonaws.com
    EFS2=fs-00d3c74b38f5ec3a9.efs.ap-southeast-2.amazonaws.com
    ;;

  ap-southeast-3) # Asia Pacific (Jakarta) {Indonesia)
    EFS=fs-0235fe95dd1a70c55.efs.ap-southeast-3.amazonaws.com
    EFS2=fs-057d1c0b60930cabc.efs.ap-southeast-3.amazonaws.com
    ;;

  ap-southeast-4) # Asia Pacific (Melbourne)
    EFS=fs-0994e5fd7ba4fc589.efs.ap-southeast-4.amazonaws.com
    EFS2=fs-050a6e2b9c9de77c2.efs.ap-southeast-4.amazonaws.com
    ;;

  ap-southeast-5) # Asia Pacific (Malaysia)
    EFS=fs-097997ec94e6b5581.efs.ap-southeast-5.amazonaws.com
    EFS2=fs-05899392e5708808f.efs.ap-southeast-5.amazonaws.com
    ;;

  ap-southeast-7) # Asia Pacific (Thailand)
    EFS=fs-0cdd71000ba1a3219.efs.ap-southeast-7.amazonaws.com
    EFS2=fs-08ab13c7a2a5370a0.efs.ap-southeast-7.amazonaws.com
    ;;

  ca-central-1) # Canada (Central)
    EFS=fs-097d1db7b352a4500.efs.ca-central-1.amazonaws.com
    EFS2=fs-0e52702bbefb606c7.efs.ca-central-1.amazonaws.com
    ;;

  ca-west-1) # Canada (Calgary)
    EFS=fs-07ec130e68a08c1f5.efs.ca-west-1.amazonaws.com
    EFS2=fs-02808550ea2a16821.efs.ca-west-1.amazonaws.com
    ;;

  eu-central-1) # Europe (Frankfurt)
    EFS=fs-04e350b9678ec7514.efs.eu-central-1.amazonaws.com
    EFS2=fs-01bd1373368406d01.efs.eu-central-1.amazonaws.com
    ;;

  eu-central-2) # Europe (Zurich)
    EFS=fs-02f9285fc8f4641d1.efs.eu-central-2.amazonaws.com
    EFS2=fs-083a9c510dffff85e.efs.eu-central-2.amazonaws.com
    ;;

  eu-north-1) # Europe (Stockholm)
    EFS=fs-01ac02b17de17c958.efs.eu-north-1.amazonaws.com
    EFS2=fs-0939161bcebeb94ff.efs.eu-north-1.amazonaws.com
    ;;

  eu-south-1) # Europe (Milan) (Italy)
    EFS=fs-0e556fc5b3f845477.efs.eu-south-1.amazonaws.com
    EFS2=fs-0b11a48b79f56f4ea.efs.eu-south-1.amazonaws.com
    ;;

  eu-south-2) # Europe (Spain)
    EFS=fs-07b7207cb5cdb0fc8.efs.eu-south-2.amazonaws.com
    EFS2=fs-00971dc2515ac7893.efs.eu-south-2.amazonaws.com
    ;;

  eu-west-1) # Europe (Ireland)
    EFS=fs-0674ed15d7c1778ee.efs.eu-west-1.amazonaws.com
    EFS2=fs-0cc130732641d633b.efs.eu-west-1.amazonaws.com
    ;;

  eu-west-2) # Europe (London)
    EFS=fs-0825e9a369572f872.efs.eu-west-2.amazonaws.com
    EFS2=fs-06f4d5c8f7de17823.efs.eu-west-2.amazonaws.com
    ;;

  eu-west-3) # Europe (Paris)
    EFS=fs-0d87e55159aed8001.efs.eu-west-3.amazonaws.com
    EFS2=fs-02b4db3ea075197a1.efs.eu-west-3.amazonaws.com
    ;;

  il-central-1) # Israel (Tel Aviv)
    EFS=fs-00330568057577874.efs.il-central-1.amazonaws.com
    EFS2=fs-03a8b49a78ecd13df.efs.il-central-1.amazonaws.com
    ;;

  me-central-1) # Middle East (UAE) United Arab Emirates
    EFS=fs-0d20d1b5a09698f87.efs.me-central-1.amazonaws.com
    EFS2=fs-0683efd88b4944281.efs.me-central-1.amazonaws.com
    ;;

  me-south-1) # Middle East (Bahrain)
    EFS=fs-070ebe5207ef277ec.efs.me-south-1.amazonaws.com
    EFS2=fs-073e69178f808658e.efs.me-south-1.amazonaws.com
    ;;

  mx-central-1) # Mexico (Central)
    EFS=fs-0bcbd4f061273a68b.efs.mx-central-1.amazonaws.com
    EFS2=fs-0b7cf1a8c1d79223c.efs.mx-central-1.amazonaws.com
    ;;

  sa-east-1) # South America (Sao Paulo)
    EFS=fs-0ad6de574706f8e5c.efs.sa-east-1.amazonaws.com
    EFS2=fs-0a9d09d0b2dec94a0.efs.sa-east-1.amazonaws.com
    ;;

  us-east-1) # United States (N. Virginia)
    EFS=fs-08390e7e2f64fa292.efs.us-east-1.amazonaws.com
    EFS2=fs-09cc6cbf3cfa6ae09.efs.us-east-1.amazonaws.com
    ;;

  us-east-2) # United States (Ohio)
    EFS=fs-076bd139f4c16a023.efs.us-east-2.amazonaws.com
    EFS2=fs-0520efc0d7ca8629f.efs.us-east-2.amazonaws.com
    ;;

  us-west-1) # United States (California)
    EFS=fs-00596c6c130ced74d.efs.us-west-1.amazonaws.com
    EFS2=fs-08948ede5b2eb842a.efs.us-west-1.amazonaws.com
    ;;

  us-west-2) # United States (Oregon)
    EFS=fs-6f45fac6.efs.us-west-2.amazonaws.com
    EFS2=fs-0bf0b691780876b53.efs.us-west-2.amazonaws.com
    ;;

# If we do not know the EFS for the REGION we exit as an error.

  *)
    echo "Unknown EFS for REGION=${REGION}" >&2
    exit 1
    ;;

esac

echo "REGION=${REGION} EFS=${EFS}"
echo "                 EFS2=${EFS2}"

EFS3=''
case ${Availability_Zone} in

  af-south-1a)
    EFS3=fs-0caa55b2b07b0df46.efs.af-south-1.amazonaws.com
    ;;

  af-south-1b)
    EFS3=fs-08f47662d92425e3c.efs.af-south-1.amazonaws.com
    ;;

  af-south-1c)
    EFS3=fs-045e547c836b9a5ca.efs.af-south-1.amazonaws.com
    ;;

  ap-east-1a)
    EFS3=fs-0b99e82891c9e01b6.efs.ap-east-1.amazonaws.com
    ;;

  ap-east-1b)
    EFS3=fs-0ae79eb793c27e047.efs.ap-east-1.amazonaws.com
    ;;

  ap-east-1c)
    EFS3=fs-0994350d719f8851c.efs.ap-east-1.amazonaws.com
    ;;

  ap-northeast-2a)
    EFS3=fs-075a1c3f4f903f7bb.efs.ap-northeast-2.amazonaws.com
    ;;

  ap-northeast-2b)
    EFS3=fs-06a4a57df990a4465.efs.ap-northeast-2.amazonaws.com
    ;;

  ap-northeast-2c)
    EFS3=fs-07376f2e3704c3e1f.efs.ap-northeast-2.amazonaws.com
    ;;

#  ap-northeast-2d) One Zone storage classes are not currently supported in this AZ.
#    EFS3=
#    ;;

  ap-northeast-3a)
    EFS3=fs-039ec2e4d4c796870.efs.ap-northeast-3.amazonaws.com
    ;;

  ap-northeast-3b)
    EFS3=fs-00d89381a6571d703.efs.ap-northeast-3.amazonaws.com
    ;;

  ap-northeast-3c)
    EFS3=fs-06dcf874fc5f2766f.efs.ap-northeast-3.amazonaws.com
    ;;

  ap-south-1a)
    EFS3=fs-002b642f4157d1ef6.efs.ap-south-1.amazonaws.com
    ;;

  ap-south-1b)
    EFS3=fs-0ef9bea593e761eb8.efs.ap-south-1.amazonaws.com
    ;;

  ap-south-1c)
    EFS3=fs-09bfa954598be699e.efs.ap-south-1.amazonaws.com
    ;;

#  ap-south-2{a,b,c}) One Zone storage classes are not currently supported in this REGION
#    EFS3=
#    ;;

  ap-southeast-1a)
    EFS3=fs-010f55630bd614071.efs.ap-southeast-1.amazonaws.com
    ;;

  ap-southeast-1b)
    EFS3=fs-0371d26924694415e.efs.ap-southeast-1.amazonaws.com
    ;;

#  ap-southeast-1c) One Zone storage classes are not currently supported in this AZ.
#    EFS3=
#    ;;

  ap-southeast-2a)
    EFS3=fs-0aa6723d74f0c753d.efs.ap-southeast-2.amazonaws.com
    ;;

  ap-southeast-2b)
    EFS3=fs-094a7736c68d74e8b.efs.ap-southeast-2.amazonaws.com
    ;;

  ap-southeast-2c)
    EFS3=fs-0733643e58fe0a8d9.efs.ap-southeast-2.amazonaws.com
    ;;

#  ap-southeast-3{a,b,c}) One Zone storage classes are not currently supported in this REGION
#    EFS3=
#    ;;

#  ap-southeast-4{a,b,c}) One Zone storage classes are not currently supported in this REGION
#    EFS3=
#    ;;

#  ap-southeast-5{a,b,c}) One Zone storage classes are not currently supported in this REGION
#    EFS3=
#    ;;

  ca-central-1a)
    EFS3=fs-0c3dc538894a8120d.efs.ca-central-1.amazonaws.com
    ;;

  ca-central-1b)
    EFS3=fs-0951ad75965dd7fa7.efs.ca-central-1.amazonaws.com
    ;;

#  ca-central-1d) One Zone storage classes are not currently supported in this AZ.
#    EFS3=
#    ;;

#  ca-west-1{a,b,c}) One Zone storage classes are not currently supported in this REGION
#    EFS3=
#    ;;

#  il-central-1{a,b,c}) One Zone storage classes are not currently supported in this REGION
#    EFS3=
#    ;;

#  me-central-1{a,b,c}) One Zone storage classes are not currently supported in this REGION
#    EFS3=
#    ;;

  me-south-1a)
    EFS3=fs-046462671b276063e.efs.me-south-1.amazonaws.com
    ;;

  me-south-1b)
    EFS3=fs-05794f38a85b46b34.efs.me-south-1.amazonaws.com
    ;;

  me-south-1c)
    EFS3=fs-0caf1a774c92e81ca.efs.me-south-1.amazonaws.com
    ;;

#  mx-central-1{a,b,c}) One Zone storage classes are not currently supported in this REGION
#    EFS3=
#    ;;

  sa-east-1a)
    EFS3=fs-0ec5ffd8b81dd1561.efs.sa-east-1.amazonaws.com
    ;;

  sa-east-1b)
    EFS3=fs-058fd782a533625f3.efs.sa-east-1.amazonaws.com
    ;;

  sa-east-1c)
    EFS3=fs-0547a1528085f9223.efs.sa-east-1.amazonaws.com
    ;;

  us-east-1a)
    EFS3=fs-092d75881922e554a.efs.us-east-1.amazonaws.com
    ;;

  us-east-1b)
    EFS3=fs-022e6f8c059b775a7.efs.us-east-1.amazonaws.com
    ;;

  us-east-1c)
    EFS3=fs-07dc643f63dd5ed50.efs.us-east-1.amazonaws.com
    ;;

  us-east-1d)
    EFS3=fs-0601aaae4764f98d2.efs.us-east-1.amazonaws.com
    ;;

#  us-east-1e) One Zone storage classes are not currently supported in this AZ.
#    EFS3=
#    ;;

  us-east-1f)
    EFS3=fs-046b3ae5e1ee46109.efs.us-east-1.amazonaws.com
    ;;

  us-east-2a)
    EFS3=fs-065d317411b513f9c.efs.us-east-2.amazonaws.com
    ;;

  us-east-2b)
    EFS3=fs-03ea8f498150b82bf.efs.us-east-2.amazonaws.com
    ;;

  us-east-2c)
    EFS3=fs-06676d82cc7a67d99.efs.us-east-2.amazonaws.com
    ;;

  us-west-1a)
    EFS3=fs-0553e8c849818f7a8.efs.us-west-1.amazonaws.com
    ;;

  us-west-1c)
    EFS3=fs-0e0ca6de0f251f3cb.efs.us-west-1.amazonaws.com
    ;;

  us-west-2a)
    EFS3=fs-0be97de4c8c35cf91.efs.us-west-2.amazonaws.com
    ;;

  us-west-2b)
    EFS3=fs-039f1f21eab6dae09.efs.us-west-2.amazonaws.com
    ;;

  us-west-2c)
    EFS3=fs-09153b514417fd19f.efs.us-west-2.amazonaws.com
    ;;

  us-west-2d)
    EFS3=fs-090fdf8e9505d1f8a.efs.us-west-2.amazonaws.com
    ;;

esac

# Mount the EFS using nfsv4

nfsOpt="_netdev,noresvport,nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 0 0"

mkdir /mnt/efs /mnt/efs2
echo "${EFS}:/ /mnt/efs nfs4 ${nfsOpt}" >> /etc/fstab
echo "${EFS2}:/ /mnt/efs2 nfs4 ${nfsOpt}" >> /etc/fstab

if [ -z ${EFS3} ]; then
  echo "One Zone EFS not available for Availability_Zone=${Availability_Zone}" >&2
else
  echo "Availability_Zone=${Availability_Zone} EFS3=${EFS3}"
  mkdir /mnt/efs3
  echo "${EFS3}:/ /mnt/efs3 nfs4 ${nfsOpt}" >> /etc/fstab
fi

systemctl daemon-reload
mount -a -t nfs4
df -Th -x supermount --exclude-type=tmpfs --exclude-type=devtmpfs
