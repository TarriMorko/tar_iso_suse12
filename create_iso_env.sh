#!/bin/bash
#
#
export LANG=POSIX
export LC_ALL=POSIX


## Check OS Version
grep -q "VERSION=\"12" /etc/os-release
rc=$?

if [ $rc -ne 0 ] ; then
    echo "This script is for SuSE 12 ONLY."
    exit 0
fi


## Backup Setting
cp -p /etc/issue /etc/issue.bak
cp -p /etc/issue.net  /etc/issue.net.bak
cp -p /etc/login.defs  /etc/login.defs.bak
cp -p /etc/pam.d/common-password-pc /etc/pam.d/common-password-pc.bak
cp -p /etc/pam.d/common-auth-pc /etc/pam.d/common-auth-pc.bak
cp -p /etc/pam.d/common-account-pc /etc/pam.d/common-account-pc.bak
cp -p /etc/pam.d/sshd /etc/pam.d/sshd.bak
tar -cf pam_d.tar.bak /etc/pam.d >/dev/null 2>&1

cp -p /etc/passwd /etc/passwd.bak
cp -p /etc/audit/audit.rules /etc/audit/audit.rules.bak
cp -p /etc/audit/auditd.conf /etc/audit/auditd.conf.bak
cp -p /etc/profile /etc/profile.bak

cp -p /etc/services /etc/services.bak
cp -p /etc/rsyslog.conf /etc/rsyslog.conf.bak


## Hardening Account
sed s/bash/false/g /etc/passwd | grep -v root  > /etc/passwd.tmp
cat /etc/passwd | grep root >> /etc/passwd.tmp
cat /etc/passwd.tmp > /etc/passwd
rm /etc/passwd.tmp

pam-config -a \
    --pwhistory --pwhistory-remember=5 \
    --cracklib-dcredit=-1 \
    --cracklib-ucredit=-1 \
    --cracklib-lcredit=-1 \
    --cracklib-minlen=6 \
    --cracklib-retry=5 \
    --cracklib \
    --cracklib-dictpath=/usr/lib/null_dict \
    --unix-sha512




##############
tar -xvpPf /tmp/tar_iso_suse12.tar
chmod 644 /etc/cron.allow /etc/issue /etc/issue.net /etc/login.defs
chmod 644 /etc/profile.local /etc/profile /etc/services
chmod 644 /etc/pam.d/common-auth-pc
chmod 644 /root/.profile
chmod 640 /etc/audit/audit.rules /etc/audit/auditd.conf /etc/ssh/sshd_config
chmod 600 /etc/rsyslog.conf
chmod 660 /etc/sudoers

systemctl restart sshd.service
systemctl restart rsyslog.service

# systemctl list-unit-files
systemctl disable autofs.service
systemctl disable blk-availability.service
systemctl disable lvm2-monitor.service
systemctl disable mdmonitor.service
systemctl disable nfs-server.service
systemctl disable nfs.service
systemctl disable nfsserver.service
systemctl disable cups.service
systemctl disable cups-browsed.service
systemctl disable bluetooth.service


mkdir -p /aulog/audreport
chmod -R 700 /aulog/audreport
chmod -R 700 /root
systemctl enable auditd.service
systemctl start auditd.service


## Add Accounts
groupadd -g 800 datactrl
groupadd -g 900 dc1
groupadd -g 920 dc3
groupadd -g 700 sp

useradd opusr -c opusr -g 800 -m -u 802 -s /bin/bash
useradd spadmin -c spadmin -g 700 -m -u 712 -s /bin/bash
useradd spos1 -c spos1 -g 700 -m -u 701 -s /bin/bash
useradd spos2 -c spos2 -g 700 -m -u 702 -s /bin/bash
useradd spos3 -c spos3 -g 700 -m -u 703 -s /bin/bash
useradd spos4 -c spos4 -g 700 -m -u 704 -s /bin/bash
