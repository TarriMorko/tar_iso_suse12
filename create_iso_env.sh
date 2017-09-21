#!/bin/bash
#
#

grep "VERSION=\"12" /etc/os-release
rc=$?

if [ $rc -ne 0 ] ; then
    echo "This script is for SuSE 12 ONLY."
    exit 0
fi

export LANG=POSIX
export LC_ALL=POSIX

cp -p /etc/issue /etc/issue.bak
cp -p /etc/issue.net  /etc/issue.net.bak
cp -p /etc/login.defs  /etc/login.defs.bak
cp -p /etc/pam.d/common-password-pc /etc/pam.d/common-password-pc.bak
cp -p /etc/pam.d/common-auth-pc /etc/pam.d/common-auth-pc.bak
cp -p /etc/pam.d/common-account-pc /etc/pam.d/common-account-pc.bak

cp -p /etc/passwd /etc/passwd.bak
cp -p /etc/audit/audit.rules /etc/audit/audit.rules.bak
cp -p /etc/audit/auditd.conf /etc/audit/auditd.conf.bak
cp -p /etc/profile /etc/profile.bak

cp -p /etc/services /etc/services.bak
tar -cf pam_d.tar.bak /etc/pam.d

cp -p /etc/rsyslog.conf /etc/rsyslog.conf.bak

cp -p /etc/pam.d/sshd /etc/pam.d/sshd.bak

#############
# sed s/bash/false/g /etc/passwd | grep -v root  > /etc/passwd.tmp
sed s/bash/nologin/g /etc/passwd | grep -v root  > /etc/passwd.tmp
cat /etc/passwd | grep root >> /etc/passwd.tmp
cat /etc/passwd.tmp > /etc/passwd
rm /etc/passwd.tmp
##############
tar -xvpPf /tmp/tar_iso_suse12.tar

# /etc/rc.d/sshd  restart
service sshd restart
# /etc/rc.d/syslog restart
service rsyslog restart

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
# chkconfig cpuspeed off
# chkconfig haldaemon off
# chkconfig ip6tables off
# chkconfig portreserve off
# chkconfig httpd off

mkdir -p /aulog/audreport
chmod -R 700 /aulog/audreport
chmod -R 700 /root

# use sha512 instead of md5 for password

# faillog -m 5 -u spos1
# faillog -m 5 -u spos2
# faillog -m 5 -u spos3
# faillog -m 5 -u dc01
# faillog -m 5 -u dcporting
# faillog -m 5 -u spadmin

