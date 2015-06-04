#
# Cookbook Name:: dstat_web
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/usr/share/nginx/html/dstat" do
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
