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

#TODO fix service start
bash "untar" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
  cp baasbox.tar.gz #{node[:baasbox][:dir]}
  cd #{node[:baasbox][:dir]}
  tar zxf baasbox.tar.gz
  ./start&
  EOH
end
