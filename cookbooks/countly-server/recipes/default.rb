git "#{node[:countly][:dir]}" do
  repository "git://github.com/Countly/countly-server.git"
  reference "master"
  action :sync
end


bash "install_countly_server" do
  cwd "#{node[:countly][:dir]}/bin"
  code <<-EOH
  ./countly.install.sh
  EOH
end
