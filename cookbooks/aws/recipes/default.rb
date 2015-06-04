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

directory "/usr/share/nginx/html/dstat" do
end

template "/etc/nginx/sites-available/dstat" do
  source 'default.erb'
  mode 0755
  owner 'root'
  group 'root'
  variables({
    :server_port => 8082,
    :server_root => "/usr/share/nginx/html/dstat" })
end


link "/etc/nginx/sites-enabled/dstat" do
  to "/etc/nginx/sites-available/dstat"
end


service "nginx" do
    action :stop
end
service "nginx" do
    action :start
end

git "/usr/share/dstat" do
  repository "git://github.com/serialdoom/dstat.git"
end

execute "tmux_create_session" do
  command "tmux new-session -d -s dstat_daemon"
end

execute "tmux_create_window" do
  command "tmux new-window -t dstat_daemon -n 'dstat' '/usr/share/dstat/dstat -ualmr --freespace  --json /usr/share/nginx/html/dstat/stats.json'"
end
