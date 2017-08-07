#!/usr/bin/perl
#coder: kodo no kami
#data: 04/08/2017 ~ 06/08/2017
#grupo: https://www.facebook.com/forumeof
#forum: https://eofclub.in/forum\n
#discord: https://discordapp.com/invite/cmzeMPv (kodo#0010)
#site: http://telenumeros.com

use WWW::Mechanize;
use Getopt::Long;

my $kodo = new WWW::Mechanize( autocheck => 0);

print "================================\n" .
"        kodo telenumeros\n" .
"================================\n\n";

my $tam = @ARGV;
my ($arg_busca,$arg_num,$arg_pag);
GetOptions("busca=s"=>\$arg_busca,"tel=s"=>\$arg_num, "page=s" => \$arg_pag);

if($tam == 0){
	print "coder: kodo no kami\n" .
	"grupo: https://www.facebook.com/forumeof\n" .
	"forum: https://eofclub.in/forum\n" .
	"discord: https://discordapp.com/invite/cmzeMPv (kodo#0010)\n".
	"site: http://telenumeros.com\n\nsintaxe:\n    perl script.pl busca 1111111111\n\n";
	exit(0);
}

if(defined($arg_num)){
	$kodo->get("http://telenumeros.com/?dir=ver&id=$arg_num");
	if($kodo->status != 200){
		print "nao encontrado\n\n";
		exit;
	}
	
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
}

if(defined($arg_busca)){
	if(defined($arg_pag)){
		$pagina = $arg_pag;
	}
	else{
		$pagina = 0;
	}
	$kodo->get("http://www.telenumeros.com/?dir=pesquisa&da=$pagina&pesquisa=$arg_busca");
	
	my @ktel = $kodo->content =~ /dir=ver.id=(.*?).nome=(.*?)".*?dati">(.*?)<\/td>.*?Cidade.*?> (.*?)<.*?Estado<\/b> (.*?)</smg;

	foreach my $kcont(@ktel){
		if($kcont =~ /^\d+$/){
			print "\n";
		}
		print $kcont . "\n";
	}
}
print "\n";
