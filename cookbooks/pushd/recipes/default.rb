git "#{node[:pushd][:dir]}" do
  repository "git://github.com/rs/pushd.git"
  reference "master"
  action :sync
end

template "#{node[:pushd][:dir]}/settings.coffee" do
  source "settings.coffee.erb"
  mode 0644
end

bash "install_pushd" do
  cwd "#{node[:pushd][:dir]}"
  code <<-EOH
  npm install
  coffee pushd.coffee > start.log&
  EOH
end

