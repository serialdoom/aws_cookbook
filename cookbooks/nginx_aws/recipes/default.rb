#
# Cookbook Name:: nginx_aws
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
apt_package "nginx" do
    action:install
end

template "/etc/nginx/sites-available/default" do
  action :create_if_missing
  source 'default.erb'
  mode 0755
  owner 'root'
  group 'root'
  variables({
    :server_port => 8080,
    :server_root => "/usr/share/nginx/html" })
end

template "/usr/share/nginx/html" do
  action :create_if_missing
  source 'index.html.erb'
  mode 0755
  owner 'root'
  group 'root'
end
