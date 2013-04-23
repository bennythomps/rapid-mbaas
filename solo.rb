file_cache_path           "/tmp/chef-solo"
data_bag_path             "/tmp/chef-solo/data_bags"
encrypted_data_bag_secret "/tmp/chef-solo/data_bag_key"

cookbook_path File.expand_path("../cookbooks", __FILE__)

role_path nil
log_level :info


http_proxy nil
http_proxy_user nil
http_proxy_pass nil
https_proxy nil
https_proxy_user nil
https_proxy_pass nil
no_proxy nil
