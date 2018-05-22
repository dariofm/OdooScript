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
ofxparse==0.14
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
pytrustnfe
python-boleto
python-cnab
http://labs.libre-entreprise.org/frs/download.php/897/pyxmlsec-0.3.1.tar.gz

##### Dependências Odoo #####
python-pip
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
libx11-6
libxext6
libxrender1
libjpeg-turbo8


##### Ferramentas Extras #####
git



sudo apt-get install -y --no-install-recommends $(grep -v '^#' apt-requeriments)
sudo pip install -r pip-requirements
sudo npm install -g less
sudo ln -s /usr/bin/nodejs /usr/bin/node

wget http://download.gna.org/wkhtmltopdf/0.12/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb #Altere o download se necessário

sudo dpkg -i wkhtmltox-0.12.1_linux-trusty-amd64.deb

sudo cp /usr/local/bin/wkhtmltopdf /usr/bin

sudo cp /usr/local/bin/wkhtmltoimage /usr/bin
wkhtmltopdf --version # Se a versão for 0.12.1, está correta.

sudo su - odoo -s /bin/bash
git clone https://github.com/odoo/odoo.git --branch 10.0 .

sudo cp /opt/odoo/odoo/debian/odoo.conf /etc/odoo-server.conf
sudo chown odoo: /etc/odoo-server.conf
sudo chmod 640 /etc/odoo-server.conf