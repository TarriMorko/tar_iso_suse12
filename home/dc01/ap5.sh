#!/bin/ksh
umask 002
LANG=POSIX

trap '' 2

PATH=/usr/sbin:$PATH
export PATH
id1=`who am i|awk '{print $6}'`
logfile=/home/logadmin/secadmlog

clear
while true
do
  clear
  echo "           "
  echo "           "
  echo "                           �X�@���w�Ȧ��ƺި��ϥΪ̺޲z�e��  "
  echo "                      =========================================="
  echo "           "
  echo "                                 1. �b���޲z                 "
  echo "                                 2. �C�X�t�β{���b��         "
  echo "                                 3. �C�X�t�β{���s��         "
  echo "                                 4. �C�X�b���P�s���ɮ�(/etc/passwd,/etc/group)       "
  echo "                                 5. ���m�ϥΪ�login fail counter "
  echo "                                 0. ���}                     "
  echo "           "
  echo -e  "                                 �п�ܥ\��-->\c"
  read a
  case "$a" in
  "0")
    echo "logout"
    exit
    ;;
  "1")
    sudo /sbin/yast users
    ;;
  "2")
    echo ======= �b�� ==========
    echo "  userid  :    group  "
    echo " ---------------------"
    for i in `cat /etc/passwd|sed s/\:/" "/g |awk '{print $1}'`
     do
     id $i|sed s/gid/" : gid"/g|sed s/\(/" "/g|sed s/\)/" "/g|awk '{print $2,$3,$5,$7,$9,$11,$13,$15,$17,$19,$21,$23,$25,$27,$29,$31,$33,$35,$37,$39}'
     done
    echo -----------------------
    echo "�Ы�Enter���~��"
    read anykey
    ;;
  "3")
    echo ======= �s�� ==========
    echo "  group   :    userid "
    echo " ---------------------"
    cat /etc/group |sed s/\:/" "/g |awk '{print $1,": "$4}'|sed s/,/" "/g
    echo -----------------------
    echo "�Ы�Enter���~��"
    read anykey
    ;;
  "4")
    echo "======= �b���ɮ�(/etc/passwd) =========="
    /bin/cat /etc/passwd | more
    echo "======= �s���ɮ�(/etc/group) =========="
    /bin/cat /etc/group | more
    echo "�Ы�Enter���~��"
    read anykey
    ;;
  "5")
    clear
    echo "�п�J�����m���ϥΪ̦W��"
    read uname
    echo �ثe�t��user login fail counter status ......
    sudo /usr/sbin/faillog
    echo -e "�z�T�w�n���m" $uname "login fail counter?(y/n)"
    read yn
    if test "$yn." = "y."
    then
      sudo /usr/sbin/faillog -u $uname -r
      echo "���m����"
      echo ���m��ثe�t��user login fail counter status ......
      sudo /usr/sbin/faillog
    echo "�Ы�Enter���~��"
    read anykey
    else echo "��󭫸m"
    echo "�Ы�Enter���~��"
    read anykey
    fi
    ;;

  *)
    echo "��ܿ��~"
    ;;
  esac
done

