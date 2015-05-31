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

apt_package "nginx" do
    action:install
end
