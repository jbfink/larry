# from 
require 'ruby-ldapserver'
class MyLdapOperations < LDAP::Server::Operation

  def search(basedn, scope, deref, filter)
    puts scope
    puts basedn
    puts deref
    puts filter[1]
  end

  def simple_bind(version,dn,password)
    puts "Auth: #{dn} + #{password}"
    puts version
  end

end
s = LDAP::Server.new(
	:port			=> 1234,
	:nodelay		=> true,
	:listen			=> 10,
#	:ssl_key_file		=> "key.pem",
#	:ssl_cert_file		=> "cert.pem",
#	:ssl_on_connect		=> true,

  :Operation_class	=> MyLDAPOperations
)
s.run_tcpserver
s.join
