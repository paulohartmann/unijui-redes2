#
# Documentação disponível:
#
# https://www.vivaolinux.com.br/artigo/Instalacao-e-configuracao-do-Samba-no-Ubuntu-Server
# https://help.ubuntu.com/community/How%20to%20Create%20a%20Network%20Share%20Via%20Samba%20Via%20CLI%20%28Command-line%20interface/Linux%20Terminal%29%20-%20Uncomplicated%2C%20Simple%20and%20Brief%20Way%21
#
class samba {

  package { "samba":
    ensure  => present,
    require => Class["system-update"],
  }

  #novo diretorio para arquivos samba
  file {'/samba':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0777';
  }

  #novo diretorio para arquivos samba
  file {'/samba/Publico':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0777';
  }
  #
  #novo diretorio para arquivos samba
  file {'/samba/NSFW':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0777';
  }

  #copia arquivo de conf do samba
  exec {"copia_conf_samba":
    require => Package["samba"],
    command => "sudo cp -f /home/dados/smb.conf /etc/samba/",
    onlyif => ['ls -l /home/dados/smb.conf'],
    notify => Exec['cria_user_samba'],
  }

  #copia arquivo de conf do samba
  exec {"cria_user_samba":
    #path => ["/usr/bin", "/usr/sbin", "/bin/bash"],
    command => "sudo /bin/bash /home/dados/adduser.sh",
    refreshonly => true
  }

}
