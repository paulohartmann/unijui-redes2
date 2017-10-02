
Exec { path => [ "/usr/bin:/usr/sbin:/bin:/usr/local/bin:/usr/local/sbin:/sbin" ] }

# instalando pacotes direto sem uso de modulos
package { [
    'vim',
    'links'
  ]:
  require => Class["system-update"], # para garantir que o pacote esteja disponivel e atualizado
  ensure  => 'installed',
}
	
#  executando comandos criação de arquivos (sem copia, cria do zero arquivo que não existe) 

   file { "/home/vagrant/puppet.txt":
    ensure  => present,
    content => "Criei um novo arquivo de exemplo",
}
  
 # garante que a copia é feita apenas depois de criado o arquivo  
  exec {"teste_copia":
	   command => "sudo cp /home/vagrant/puppet.txt /var/www/novo.txt",
		onlyif => ['ls -l /home/vagrant/puppet.txt'],
}  

# Cria arquivo index somente se o serviço Apache esta presente
  file { "/var/www/index.html":
	ensure  => present,
	require => Class["apache"], # para garantir que o apache esta instalado
   content => " <html><body><h1> Servidor Apache - It works!</h1>
  <p> VM Sausen com precise64 Rodando OK !!!!! </p>
  <p>The web server software is running but no content has been added, yet.</p>
  </body></html>",
}

# instalando pacotes a partir  uso dos modulos
include system-update
include apache
include arquivos

