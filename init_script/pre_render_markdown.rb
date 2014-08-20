require 'mysql2-cs-bind'
require 'json'

def connection
  config = JSON.parse("/home/isu-user/isucon/webapp/config/#{ ENV['ISUCON_ENV'] || 'local' }.json"))['database']
  return $mysql if $mysql
  $mysql = Mysql2::Client.new(
    :host => config['host'],
    :port => config['port'],
    :username => config['username'],
    :password => config['password'],
    :database => config['dbname'],
    :reconnect => true,
  )
end

mysql = connection
memos = mysql.xquery('SELECT id, user, content FROM memos')
bin = '/home/isu-user/isucon/webapp/bin/markdown'
memos.each do |memo|
  tmp = Tempfile.open("isucontemp_#{memo["id"]}")
  tmp.puts(memp["content"])
  tmp.close
  html = ''
  html = `#{bin} #{tmp.path}`
  mysql.xquery('UPDATE memos SET content_html=? WHERE id=? ', html, memo["id"])
end
