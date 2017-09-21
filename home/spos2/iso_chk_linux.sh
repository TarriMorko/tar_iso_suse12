#!/bin/ksh
wrkdir=/home/spos2
hname=`hostname`
outfil=/home/spos2/$hname.iso_chk_linux.txt
echo "############################"  > $outfil
echo "# LINUX�t�αj���ˮ֪���� #" >> $outfil
echo "############################"  >> $outfil
echo "  " >> $outfil
echo  Hostname: $hname >> $outfil
echo "  " >> $outfil
echo "1-1 �n���e����welcome message�O�_�t���t�θ�T�H" >> $outfil
echo "==================================" >> $outfil
echo " cat /etc/issue" >> $outfil
cat /etc/issue >> $outfil
echo "---------   ----------  ----------- " >> $outfil
echo "cat /etc/issue.net" >> $outfil
cat /etc/issue.net >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil

 
echo "2-1 �T�{�K�X�~��̺޲z�n�I�]�w�H" >> $outfil
echo "==================================" >> $outfil
echo " cat /etc/login.defs|grep PASS_MAX_DAYS"  >> $outfil
cat /etc/login.defs|grep PASS_MAX_DAYS |grep -v "^#" >> $outfil
echo "---------   ----------  ----------- " >> $outfil
echo "cat /etc/pam.d/common-password |grep passphrase " >> $outfil
cat  /etc/security/pam_pwcheck.conf |grep remember|grep -v "^#"  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil

echo "2-2 �T�{�ϥΪ̱b�����i�P�O�ʡH" >> $outfil
echo "==================================" >> $outfil
echo " cat /etc/passwd "  >> $outfil
cat /etc/passwd   >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil

echo "2-3�T�{root�b�����޲z�O�_�A��H " >> $outfil
echo "==================================" >> $outfil
echo "2-3-2 �T�{/etc/passwd��/etc/group�Aroot��uid��gid "  >> $outfil
echo "�P 2-2 /etc/passwd ��" >> $outfil
echo "----------------------------------" >> $outfil
echo " cat /etc/group  "  >> $outfil
cat /etc/group   >> $outfil
echo "----------------------------------" >> $outfil

echo "2-3-3 �C�X/etc/passwd��/etc/group���Auid��gid��0���Ҧ��ϥΪ�"  >> $outfil
cat /etc/passwd |grep ':0:0' >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil


echo "2-4 �T�{�����n�t�ιw�]�b���O�_��������w " >> $outfil
echo "==================================" >> $outfil
echo "2-4-1 �ˬd/etc/passwd�b���C��A�O�_�d��guest�b���H "  >> $outfil
echo "cat /etc/passwd |grep guest "  >> $outfil
cat /etc/passwd |grep guest   >> $outfil
echo "----------------------------------" >> $outfil

echo "2-4-2 �C�ܼt�ӨϥΤ��b�� "  >> $outfil
echo "�p2-2 /etc/passwd ��,�L�t�ӨϥΤ��b��"  >> $outfil
echo "----------------------------------" >> $outfil

echo "2-4-3 �C�ܩҦ��t�ιw�]�b��" >> $outfil
echo "cat /etc/passwd |awk 'FS=":"  {print $1,$3}'|awk '$2 < 200 {print $1}'"  >> $outfil
cat /etc/passwd |awk 'FS=":"  {print $1,$3}'|awk '$2 < 200 {print $1}'  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil


echo "2-5 �@��b���޲z" >> $outfil
echo "==================================" >> $outfil
echo "2-5-1,2 cat /etc/passwd "  >> $outfil
echo "�P 2-2 /etc/passwd ��" >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil

echo "2-6 �T�{�j���ϥΪ̥��@����ʧ@�W�L�@�w�ɶ��ɡA���H�j���n�X�H" >> $outfil
echo "==================================" >> $outfil
echo "cat /etc/profile.local |grep TMOUT |grep 900"  >> $outfil
cat /etc/profile.local |grep TMOUT |grep 900  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil



echo "2-7 �T�{�t�ιw�]�ϥΪ̱b����umask�Ȭ�027�" >> $outfil
echo "==================================" >> $outfil
echo "cat /root/.profile |grep umask "  >> $outfil
cat /root/.profile |grep umask  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil

echo "2-8 �ˬdroot�n�J�ɬO�_����Droot���{���"  >> $outfil
echo "==================================" >> $outfil
echo "ls -l /root/.profile" >> $outfil
ls -l /root/.profile >> $outfil
cat /root/.profile  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil

echo "2-9 �T�{�O�_���������ݭn�n�J�v�����t�ιw�]�b���"  >> $outfil
echo "==================================" >> $outfil
echo "�P 2-2 /etc/passwd ��" >> $outfil
cat /etc/passwd |grep adm:x |grep -v itmadm >> $outfil
cat /etc/passwd |grep bin:x >> $outfil
cat /etc/passwd |grep daemon:x >> $outfil
cat /etc/passwd |grep listen >> $outfil
cat /etc/passwd |grep lp >> $outfil
cat /etc/passwd |grep nobody >> $outfil
cat /etc/passwd |grep noaccess >> $outfil
cat /etc/passwd |grep nuucp >> $outfil
cat /etc/passwd |grep stmtp >> $outfil
cat /etc/passwd |grep sys:x >> $outfil
cat /etc/passwd |grep uucp >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil


echo "3-1 �T�{����telnet�A��" >> $outfil
echo "==================================" >> $outfil
echo "netstat -an |grepa :23 |grep LISTEN" >> $outfil
netstat -an |grep :23|grep LISTEN  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil


echo "3-2 �T�{�ҥ�SSH�s�u���A���H" >> $outfil
echo "==================================" >> $outfil
echo "netstat -an |grep 22|grep LISTEN"  >> $outfil
netstat -an |grep :22|grep LISTEN  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil

echo "4-1 �T�{�t�Τ��]�֥\��O�_�w�g�ҰʡH "  >> $outfil
echo "==================================" >> $outfil
echo "4-1-1 ps -ef|grep audit |grep -v grep "  >> $outfil
ps -ef|grep audit |grep -v grep   >> $outfil
echo "----------------------------------" >> $outfil
echo "4-1-2 cat auditd.conf |grep -v "#" "  >> $outfil
cat /etc/audit/auditd.conf |grep -v "^#"  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil


echo "4-2 �T�{�t�ν]��log�ɬO�_�A��O�@�H "  >> $outfil
echo "==================================" >> $outfil
echo "ls -l /aulog "  >> $outfil
ls -l /aulog   >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil


echo "5-1 �T�{cron�]�w���A���,��crontab file(/var/spool/cron/tabs)�O�_�A��O�@� "  >> $outfil
echo "==================================" >> $outfil
echo '5-1-1 crontab -l |grep -v "^#"'  >> $outfil
crontab -l |grep -v "^#"  >> $outfil
echo "----------------------------------" >> $outfil
echo '5-1-2 cat /etc/cron.allow'  >> $outfil
cat /etc/cron.allow  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil

echo "6-1 �T�{�@�~�t�άO�_�w���������n�������A��(inetd) "  >> $outfil
echo "==================================" >> $outfil
cat /etc/services |grep finger >> $outfil
cat /etc/services |grep ftp|grep " 21/"  >> $outfil
cat /etc/services |grep gopher >> $outfil
cat /etc/services |grep imap |grep "143/" >> $outfil
cat /etc/services |grep pop2 >> $outfil
cat /etc/services |grep talk |grep "517/" >> $outfil
cat /etc/services |grep talk |grep "518/" >> $outfil
cat /etc/services |grep telnet |grep " 23/" >> $outfil
cat /etc/services |grep uucp |grep "540/" >> $outfil
cat /etc/services |grep nfs |grep "2049/" >> $outfil
cat /etc/services |grep "nis   "|grep "/tcp"|grep "/udp" >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil

echo "6-2 �T�{�u�}�ҥ��n���q�T���TCP/IP�A��"  >> $outfil
echo "==================================" >> $outfil
echo "cat /etc/xinetd.conf |grep -v "^#""  >> $outfil
cat /etc/xinetd.conf |grep -v "^#"  >> $outfil
echo "----------------------------------" >> $outfil
echo "chkconfig --list |tail -18 "  >> $outfil
chkconfig --list |tail -18   >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil


echo "7-1 �T�{�ثe�O�_�w��s�ܭ׸ɵ{�����̾A�����C " >> $outfil
echo "==================================" >> $outfil
echo "�����b�~�e���̾A����"   >> $outfil
sam --no-header-sig-check --no-rpm-verify --no-rpm-verify-md5 --skip-unmatched-prod --strict-repo-description --no-log-timestamp |grep name:|awk '{print $2}'  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil

echo "8-1 �T�{�O�_����t�ήz�I���y�C "  >> $outfil
echo "==================================" >> $outfil
echo "��w�짡�w������z�I���y"  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil


echo "9-1 �D�����餧�_�ͬO�_�w�����O�ޡB�ϥΡH"  >> $outfil
echo "==================================" >> $outfil
echo "�D�����餧�_�;��г]ï�n�O�ި�"  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil

echo "9-2 �T�{���о����ϥΫY�ݾA��H"  >> $outfil
echo "==================================" >> $outfil
echo "�w�˳n��B�}�ӽг�֭��i���Шϥ�"  >> $outfil
echo "----------------------------------" >> $outfil
echo "  " >> $outfil
