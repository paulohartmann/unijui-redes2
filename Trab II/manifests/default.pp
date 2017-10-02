
Exec { path => [ "/usr/bin:/usr/sbin:/bin:/usr/local/bin:/usr/local/sbin:/sbin" ] }

# instalando pacotes direto sem uso de modulos
package { [
    'vim',
    'links'
  ]:
  require => Class["system-update"], # para garantir que o pacote esteja disponivel e atualizado
  ensure  => 'installed',
}

# garante que a copia é feita apenas depois de criado o arquivo
  exec {"teste_copia":
    require => Class["nginx"],
    command => "sudo cp -R /home/www/* /usr/share/nginx/www/",
    onlyif => ['ls -l /home/www/index.html']
}

# instalando pacotes a partir  uso dos modulos
include system-update
include samba
include nginx
