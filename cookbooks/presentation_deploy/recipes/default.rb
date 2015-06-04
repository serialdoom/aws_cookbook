#
# Cookbook Name:: presentation_deploy
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

git "/tmp/presentation" do
  repository "git://github.com/serialdoom/aws_presenations.git"
end

execute "rsync to default html location" do
  command "rsync -avl /tmp/presentation/ /usr/share/nginx/html/"
end
