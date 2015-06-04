#
# Cookbook Name:: aws
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

execute "apt-get-update" do
  command "apt-get update"
  ignore_failure true
end

package ["rsnapshot", "rkhunter", "chkrootkit", "tiger", "fail2ban", "nmap", "logwatch" ]


execute "logwatch to crontab" do
    command "echo \"/usr/sbin/logwatch --output mail --mailto mhristof@gmail.com --detail high\" > /etc/cron.daily/00logwatch"
end

execute "adjust ssh settings" do
    command "perl -p -i -e 's/^PermitRootLogin.*/PermitRootLogin No/g' /etc/ssh/sshd_config"
    command "perl -p -i -e 's/^PasswordAuthentication.*/PasswordAuthentication No/' /etc/ssh/sshd_config"
end

