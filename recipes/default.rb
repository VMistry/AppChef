#
# Cookbook:: node
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
apt_update "update_sources" do
  action :update
end


package "nginx" #Installs nginx

service "nginx" do
  action [:enable, :start]
end

nodejs_npm("pm2") do
  action :install
end

template '/etc/nginx/sites-available/proxy.conf' do
  source "proxy.conf.erb"
  notifies(:restart, 'service[nginx]')
end

link '/etc/nginx/sites-enabled/proxy.conf' do
  to '/etc/nginx/sites-available/proxy.conf'
end

link '/etc/nginx/sites-enabled/default' do
  action :delete
end

include_recipe ("nodejs")
