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
sudo -u postgres psql -e --command "CREATE USER odoo WITH SUPERUSER PASSWORD 123'"