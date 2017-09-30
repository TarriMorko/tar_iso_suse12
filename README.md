# tar_iso_suse12
# Changelog

## [Unreleased]


## [1.0.1] - 2017-09-30
### Fixed
- 修正執行 iso_chk_linux.sh 時的錯誤訊息（pam-config的錯誤訊息可忽略）
- 將 iso_chk_linux.sh 中的 chkconfig 指令改為 systemctl list-unit-files
- 將密碼記憶次數從 3 次改為 5 次


# 安裝方法
1. 把 tar_iso_suse12.tar 跟 create_iso_env.sh 放到 /tmp 
2. 執行 create_iso_env.sh
3. 給帳號 spos2 設定一個新的密碼 passwd spos2
4. 重開機
5. 用spos2 登入
6. 切換到 root
7. 執行 /tmp/iso_chk_linux.sh
8. 在 /home/spos2/ 裡面會產生一個 xxx_iso_chk_linux.
