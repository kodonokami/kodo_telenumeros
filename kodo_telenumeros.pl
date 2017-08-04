#!/usr/bin/perl
#coder: kodo no kami
#data: 04/08/2017
#grupo: https://www.facebook.com/forumeof
#forum: https://eofclub.in/forum\n
#discord: https://discordapp.com/invite/cmzeMPv (kodo#0010)
#site: http://telenumeros.com

use WWW::Mechanize;

my $kodo = new WWW::Mechanize;

print "================================\n" .
"        kodo telenumeros\n" .
"================================\n\n";

my $tam = @ARGV;
if($tam == 0){
	print "coder: kodo no kami\n" .
	"grupo: https://www.facebook.com/forumeof\n" .
	"forum: https://eofclub.in/forum\n" .
	"discord: https://discordapp.com/invite/cmzeMPv (kodo#0010)\n".
	"site: http://telenumeros.com\n\nsintaxe:\n    perl script.pl 1111111111\n\n";
	exit(0);
}

$kodo->get("http://telenumeros.com/?dir=ver&id=$ARGV[0]");
my $kami = $kodo->content;

my @knome =  $kami =~ /detagliNome..(.*?)</;
my @ktel = $kami =~ /Telefone.*?(\d+)\</s;
my @kend = $kami =~ /<b>Endere.o<\/b> (.*?)</s;
my @kcid = $kami =~ /Cidade<\/b> (.*?)</s;
my @kestado = $kami =~ /Estado<\/b> (.*?)</s;
my @kcep = $kami =~ /CEP<\/b> (.*?)</s;


print "nome: " . $knome[0] . "\n";
print "telefone: " . $ktel[0] . "\n";
print "Endereco: " . $kend[0] . "\n";
print "Cidade: " . $kcid[0] . "\n";
print "Estado: " . $kestado[0] . "\n";
print "Cep: " . $kcep[0] . "\n";
print "\n";
