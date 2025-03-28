#!/usr/bin/env bash

### [PACOTES DEB E URL'S PARA DOWNLOAD]
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

### [DIRETÓRIO DOS ARQUIVOS BAIXADOS]
DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

### [CRIANDO A PASTA SENÃO EXISTIR, BAIXANDO E INSTALANDO OS ARQUIVOS .DEB]
mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$URL_GOOGLE_CHROME"       -P "$DIRETORIO_DOWNLOADS"
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

### [PACOTES APT PARA INSTALAÇÃO]
PROGRAMAS_PARA_INSTALAR=(
  flatpak
  gnome-software-plugin-flatpak
  snapd
  ubuntu-restricted-extras
  build-essential
  ttf-mscorefonts-installer
  git
  wget
  synaptic
  gparted
  timeshift
  vlc
  gufw
  gnome-tweaks
  simple-scan
  geany
  geany-plugins
)

### [REMOVENDO BLOQUEIOS DO APT E ATUALIZANDO O REPOSITÓRIO DO SISTEMA]
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock
sudo dpkg --add-architecture i386
sudo apt update -y

### [ACEITANDO TERMOS DE LICENÇAS]
echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | sudo debconf-set-selections

### [INSTALANDO OS PACOTES APT E ADICIONANDO ACESSO FLATHUB]
for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
  if ! dpkg -l | grep -q $nome_do_programa; then # Só instala se já não estiver instalado
    apt install "$nome_do_programa" -y
  else
    echo "[INSTALADO] - $nome_do_programa"
  fi
done

### [INSTALANDO PACOTES FLATPAK]
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak update
flatpak install flathub com.bitwarden.desktop -y

### [INSTALANDO PACOTES SNAP]
sudo snap refresh
sudo snap install code --classic
sudo snap install sublime-text --classic
sudo snap install libreoffice
sudo snap install shotwell
sudo snap install gimp
sudo snap install spotify

### [LIMPEZA E PÓS INSTALAÇÃO]
sudo apt update && sudo apt dist-upgrade -y
sudo apt clean
sudo apt autoclean
sudo apt autoremove -y
echo "INSTALAÇÃO FINALIZADA!"
