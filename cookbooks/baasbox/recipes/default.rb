user node[:baasbox][:user] do
  action :create
  system true
  shell "/bin/false"
end

directory node[:baasbox][:dir] do
  owner node[:baasbox][:user]
  mode "0755"
  action :create
end

remote_file "#{Chef::Config[:file_cache_path]}/baasbox.tar.gz" do
  source "http://www.baasbox.com/?wpdmact=process&did=Mi5ob3RsaW5r"
  action :create_if_missing
end


template "/etc/init/baasbox.conf" do
  source "baasbox.conf.erb"
  mode 0644
end

service "baasbox" do
  supports :status => true, :start => true, :stop => true, :restart => true
end


bash "untar" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
  cp baasbox.tar.gz #{node[:baasbox][:dir]}
  cd #{node[:baasbox][:dir]}
  tar zxf baasbox.tar.gz
  service baasbox restart
  EOH
end
