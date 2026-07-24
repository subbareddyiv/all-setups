    1  sudo yum update -y
    2  sudo yum install wget -y
    3  sudo yum install java-21-amazon-corretto -y
    4  sudo mkdir /app && cd /app
    5  sudo wget -O nexus.tar.gz https://download.sonatype.com/nexus/3/nexus-3.94.0-12-linux-x86_64.tar.gz
    6  ll
    7  sudo tar -xvf nexus.tar.gz
    8  ll
    9  sudo mv nexus-3* nexus
   10  sudo adduser nexus
   11  sudo chown -R nexus:nexus /app/nexus
   12  sudo chown -R nexus:nexus /app/sonatype-work
   13  sudo vi  /app/nexus/bin/nexus.rc 

run_as_user="nexus"

   14  sudo vi /app/nexus/bin/nexus.vmoptions
   15  sudo vi /etc/systemd/system/nexus.service		

[Unit]
Description=nexus service
After=network.target

[Service]
Type=forking
LimitNOFILE=65536
User=nexus
Group=nexus
ExecStart=/app/nexus/bin/nexus start
ExecStop=/app/nexus/bin/nexus stop
User=nexus
Restart=on-abort

[Install]
WantedBy=multi-user.target

   16  sudo chkconfig nexus on
   17  ./nexus start
   
   18  ./neus status
