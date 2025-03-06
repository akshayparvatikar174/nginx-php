package 'nginx'
package 'php-fpm'

service 'nginx' do
  action [:enable, :start]
end

ruby_block 'detect_php_version' do
  block do
    php_version = `php -v | grep -oP '^PHP \\K[0-9]+\\.[0-9]+'`.strip
    node.override['php_version'] = php_version
  end
end

service 'php-fpm' do
  service_name lazy { "php#{node['php_version']}-fpm" }
  action [:enable, :start]
  only_if { ::File.exist?("/run/php/php#{node['php_version']}-fpm.sock") }
end

# Configure Nginx to support PHP
file '/etc/nginx/sites-available/default' do
  content <<-EOH
server {
    listen 80;
    server_name _;
    root /var/www/html;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php#{node['php_version']}-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}
  EOH
  notifies :restart, 'service[nginx]', :immediately
end

# Deploy PHP file to display Nginx version
file '/var/www/html/index.php' do
  content <<-EOH
<?php
echo "<h1>Welcome to Your Nginx Server Akshay Parvatikar!</h1>";
echo "<p>Installed Nginx Version: " . shell_exec('nginx -v 2>&1 | cut -d":" -f2') . "</p>";
?>
  EOH
  mode '0644'
  owner 'www-data'
  group 'www-data'
end

# Restart Nginx to apply changes
service 'nginx' do
  action :restart
end
~  
