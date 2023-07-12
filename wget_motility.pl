#!/usr/bin/perl
use strict;
use warnings;

my $wget;
my $grep;
my $quote;
my $before_quote;
my $after_quote;
my @rest_of_line;

my $word1="motility";

open (LIST,"Genes2.txt")||die "cannot open list\n";
open (OUT,">output_motility_human_genes.txt")||die "cannot open list\n";

while (<LIST>){

	chomp;
	
	$wget=`wget http://pubmed.ncbi.nlm.nih.gov/?term='"$word1"'+AND+'"$_"' -O wget.html`;

	## No Publications	
	open(FILE,"wget.html");

	if (grep{/No results were found/} <FILE>){
	
		print("No publications found!\n");
		print("$word1 + $_	0\n");
		print(OUT "$word1 + $_	0\n");
	}
	
	close FILE;
	

	## 1 Publications
	open(FILE,"wget.html");
	
	if (grep{/single-result-redirect-message/} <FILE>){
	
		print("1 publication found!\n");
		print("$word1 + $_	1\n");
		print(OUT "$word1 + $_	1\n");
	}
	
	close FILE;
	
  	
  	## Many Publications
  	open(FILE,"wget.html");
	
	if(grep{/data-results-amount/} <FILE>){
	
		print "Many publications found!\n";
		
		$grep=`grep data-results-amount wget.html`;
		($before_quote,$quote,$after_quote,@rest_of_line)=split('"', $grep);
		print "$word1 + $_	$quote\n";
		print OUT "$word1 + $_	$quote\n";
	}
	
	close FILE;
}
