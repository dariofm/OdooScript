echo -e "\n---- Atualizando Servidor ----"
sudo apt-get update
sudo apt-get upgrade -y
sudo locale-gen en_US en_US.UTF-8 pt_BR.UTF-8

#--------------------------------------------------
# Instalando PostgreSQL Server
#--------------------------------------------------
echo -e "\n---- Instalando PostgreSQL Server ----"
sudo apt-get install postgresql -y
sudo service postgresql restart
echo -e "\n---- Criando usuário "odoo" no PostgreSQL Server ----"
sudo -u postgres psql -e --command "CREATE USER odoo WITH SUPERUSER PASSWORD '1q2w3e4r'"

##### Dependências Odoo #####
gcc
python-pip
python-dev
libxml2-dev
libxslt-dev
libevent-dev
libsasl2-dev
libldap2-dev
libpq-dev
libjpeg-dev
nodejs
npm

##### Dependências da Localização Brasileira #####
python-libxml2
libxmlsec1-dev
python-openssl
python-cffi

##### Dependências do WKHTMLTOX #####
zlib1g-dev
fontconfig
libfreetype6
libfreetype6-dev
libx11-6
libxext6
libxrender1
libjpeg-turbo8


##### Ferramentas Extras #####
git
Babel==1.3
Jinja2==2.7.3
Mako==1.0.1
MarkupSafe==0.23
Pillow==2.7.0
Python-Chart==1.39
PyYAML==3.11
Werkzeug==0.9.6
argparse==1.2.1
decorator==3.4.0
docutils==0.12
feedparser==5.1.3
gdata==2.0.18
gevent==1.0.2
greenlet==0.4.7
jcconv==0.2.3
lxml==3.4.1
mock==1.0.1
ofxparse==0.16
passlib==1.6.2
psutil==2.2.0
psycogreen==1.0
psycopg2==2.5.4
pyPdf==1.13
pydot==1.0.2
pyparsing==2.0.3
pyserial==2.7
python-dateutil==2.4.0
python-ldap==2.4.19
python-openid==2.2.5
pytz==2014.10
pyusb==1.0.0b2
qrcode==5.1
reportlab==3.1.44
requests==2.6.0
six==1.9.0
suds-jurko==0.6
vobject==0.6.6
wsgiref==0.1.2
XlsxWriter==0.7.7
xlwt==0.7.5
openpyxl==2.4.0-b1
boto==2.38.0
odoorpc
suds_requests
http://labs.libre-entreprise.org/frs/download.php/897/pyxmlsec-0.3.1.tar.gz
plotly==1.13.0
pandas==0.19.2
relatorio==0.6.4
xlrd==1.0.0
urllib3==1.22
pyopenssl==17.2.0

sudo apt-get install -y --no-install-recommends $(grep -v '^#' apt-requirements)
sudo pip install --upgrade pip
sudo pip install -r pip-requirements
sudo npm install -g less
sudo ln -s /usr/bin/nodejs /usr/bin/node
wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb
sudo dpkg -i wkhtmltox-0.12.1_linux-trusty-amd64.deb

git clone https://github.com/odoo/odoo.git


sudo cat <<EOF > /etc/odoo.conf
[options]
addons_path = /opt/odoo/core/addons,/opt/odoo/modulos/localbr,/opt/odoo/modulos/backend
admin_passwd = 1q2w3e4r
auto_reload = False
csv_internal_sep = ,
db_host = localhost
db_port = 5432
db_maxconn = 64
db_name = False
#dbfilter = ^%d$
xmlrpc = True
xmlrpc_port = 8888
db_template = template0
db_user = odoo
db_password= 1q2w3e4r
logfile = /var/log/odoo/log
EOF

echo "\n---- Criando arquivo de inicialização do servidor ---"
sudo cat <<EOF > /etc/systemd/system/odoo.service
[Unit]
Description= Servidor Odoo - ADAX Technology
Documentation=http://www.adaxtechnology.com/
Contact=contato@adaxtechnology.com

[Service]

# Ubuntu:

Type=simple
User=odoo
PIDFile=/var/run/odoo.pid
ExecStart=/opt/odoo/core/odoo-bin -c /etc/odoo.conf
Restart=on-abort

[Install]
WantedBy=default.target
EOF

sudo chmod a+x /etc/systemd/system/odoo.service

echo -e "\n---- Startando serviço do Servidor Odoo ----"
sudo systemctl enable odoo.service

echo -e "\n---- Ativando serviço do Servidor Odoo no boot ----"
sudo systemctl start odoo.service
sudo service odoo status
