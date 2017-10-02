class arquivos {
# Cria um arquivo novo chamado arq_teste.txt a partir da copia modules/arquivos/files/arq.txt
#  Apenas para efeito de exemplo de como criar um arquivo a partir da copia de um já existente	
file {'/home/vagrant/arq_teste.txt':
     ensure => file,
     owner  => 'root',
     group  => 'root',
     mode   => '0644',
     source => 'puppet:///modules/arquivos/arq.txt',
   } 

# Exemplo de como criar um diretorio novo	 na VM
	file {'/home/vagrant/novo':
	     ensure => directory,
	     owner  => 'root',
	     group  => 'root',
	     mode   => '0644';
	   } 
		
# cria um novo arquivo dentro diretorio anteriormente criado
		file {'/home/vagrant/novo/segundo_arquivo.txt':
		     ensure => file,
			  require => File['/home/vagrant/novo'],  # para garantir que existe o diretorio preste atenção na sintaxe com F mauisculo e o uso de []
		     owner  => 'root',
		     group  => 'root',
		     mode   => '0644',
			  source => 'puppet:///modules/arquivos/arq.txt',
		   }   
}