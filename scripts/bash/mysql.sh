mkdir -p ~/tmp/mysql

docker run --name mysql -v $HOME/tmp/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=pw -p 3306:3306 -d mysql:5.6