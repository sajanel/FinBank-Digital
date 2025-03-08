dpkg -l | grep mssql-tools
sudo apt-get install -y mssql-tools unixodbc-dev
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc
sqlcmd -S localhost -U sa -P 'YourPassword123'
systemctl status mssql-server
dpkg -l | grep mssql-server
sudo apt-get install -y mssql-server
sudo /opt/mssql/bin/mssql-conf setup
sqlcmd -S localhost -U sa -P 'YourPassword123'


