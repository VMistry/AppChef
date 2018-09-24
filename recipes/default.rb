#
# Cookbook:: node
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
package "nginx" #Installs nginx

service "nginx" do
  action [:enable, :start]
end

nodejs_npm("pm2") do
  action :install
end

include_recipe ("nodejs")
