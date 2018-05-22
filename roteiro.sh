#!/bin/bash

# © 2018 Thiago Macedo, ADAX Technology
# License AGPL-3.0 or later (http://www.gnu.org/licenses/agpl.html).

#--------------------------------------------------
# Atualizando Servidor
#--------------------------------------------------
echo -e "\n---- Atualizando Servidor ----"
sudo apt-get update
sudo apt-get upgrade -y
sudo locale-gen en_US en_US.UTF-8 pt_BR.UTF-8

#--------------------------------------------------
# Instalando PostgreSQL Server
#--------------------------------------------------
sudo adduser --system --home=/opt/odoo --group odoo
echo -e "\n---- Instalando PostgreSQL Server ----"
sudo apt-get install postgresql -yls
sudo service postgresql restart
echo -e "\n---- Criando usuário "odoo" no PostgreSQL Server ----"
sudo -u postgres psql -e --command "CREATE USER odoo WITH SUPERUSER PASSWORD '1q2w3e4r'"

#--------------------------------------------------
# Instalando Dependências
#--------------------------------------------------
sudo apt-get install python-pip libxml2-dev libxslt-dev libevent-dev libsasl2-dev libldap2-dev libpq-dev libjpeg-dev nodejs npm
sudo apt-get install python-libxml2 libxmlsec1-dev python-openssl python-cffi 
sudo apt-get install zlib1g-dev fontconfig libfreetype6 libfreetype6-dev libx11-6 libxext6 libxrender1 libjpeg-turbo8
sudo apt-get install git -yls
sudo apt-get install build-essential autoconf libtool pkg-config python-opengl python-imaging python-pyrex python-pyside.qtopengl idle-python2.7 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 python-dev libpq-dev 
sudo apt-get install subversion git bzr bzrtools python-pip postgresql python-all-dev python-dev python-setuptools libxml2-dev libxslt1-dev libevent-dev libsasl2-dev libldap2-dev pkg-config libtiff5-dev libjpeg8-dev libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev liblcms2-utils libwebp-dev tcl8.6-dev tk8.6-dev python-tk libyaml-dev fontconfig
sudo apt-get install python-dev python-yaml python-feedparser python-geoip python-imaging python-pybabel python-unicodecsv wkhtmltopdf libxml2-dev libxmlsec1-dev python-argparse python-babel python-cups python-dateutil python-decorator python-docutils python-feedparser python-gdata python-gevent python-greenlet python-jinja2 python-libxslt1 python-lxml python-mako python-markupsafe python-mock python-openid python-passlib python-psutil python-psycopg2 python-pychart python-pydot python-pyparsing python-pypdf python-ldap python-yaml python-reportlab python-requests python-simplejson python-six python-tz python-unittest2 python-vatnumber python-vobject python-webdav python-werkzeug python-wsgiref python-xlwt python-zsi python-dev libpq-dev poppler-utils python-pdftools antiword


#--------------------------------------------------
# Instalar e atualizar as dependências do python
#--------------------------------------------------


sudo pip install --upgrade pip
sudo pip install -U setuptools 
sudo easy_install greenlet   
sudo easy_install gevent
sudo apt-get install -y python-matplotlib -yls
sudo apt-get install -y font-manager -yls
sudo apt-get install apache2 -yls
sudo apt-get install python-pip -yls
sudo apt-get install python-setuptools -yls
sudo pip install pyserial==2.7
sudo pip install psycogreen==1.0
sudo pip install pyusb==1.0.0b1
sudo pip install qrcode==5.0.1
sudo pip install Pillow==2.5.1
sudo pip install boto==2.38.0
sudo pip install oerplib==0.8.4
sudo pip install jcconv==0.2.3
sudo pip install pytz==2014.4
sudo pip install pysftp
sudo pip install num2words
sudo pip install suds
sudo pip install signxml
sudo pip install pyboleto






