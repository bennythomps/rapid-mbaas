git "#{node[:pushd][:dir]}" do
  repository "git://github.com/rs/pushd.git"
  reference "master"
  action :sync
end

template "#{node[:pushd][:dir]}/settings.coffee" do
  source "settings.coffee.erb"
  mode 0644
end

template "/etc/init/pushd.conf" do
  source "pushd.conf.erb"
  mode 0644
end

service "pushd" do
  supports :status => true, :start => true, :stop => true, :restart => true
end

bash "install_pushd" do
  cwd "#{node[:pushd][:dir]}"
  code <<-EOH
  npm install
  service pushd restart
  EOH
end

