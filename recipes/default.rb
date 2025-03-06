file '/var/www/html/index.html' do
  content <<-EOH
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nginx Server</title>
</head>
<body>
    <h1>Welcome to Nginx Server</h1>
    <p>Version is 1.24.0</p>
</body>
</html>
  EOH
  mode '0644'
  owner 'www-data'
  group 'www-data'
end
