if not File.directory?"/var/www/thespace"
    directory "/var/www/thespace" do
    action :create
    recursive true
    end
end

if not File.directory?"/var/log/thespace"
    directory "/var/log/thespace" do
    action :create
    recursive true
    mode 0744
    owner "apache"
    group "apache"
    end
end

# thespace http template
template "/etc/httpd/conf.d/thespace-vhost.conf" do
    source "thespace-vhost.erb"
    mode 0644
    owner "root"
    group "root"
    notifies :restart, resources(:service => "apache2")
end


