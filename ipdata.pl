#!/usr/bin/perl

use Net::IP;

$targets = $ARGV[0];

 if($targets eq '') {
  print "Please specify a targets file\n";
  exit;
 } else {
  open(TARGETFILE, "<", $targets) or die "Cannot open < $targets $!\n";
  open(ERRORFILE, ">Errors.log");
  open(CLEANFILE, ">targets.csv");
 }


 # print the header of the CSV
 print CLEANFILE "Submitted,ipver,numhosts,netmask,first,last,type\n";

  while(<TARGETFILE>) {
   my $host = $_;
   chomp($host);

   print "Checking ".$host."\n";
  
   my $ip = new Net::IP ($host);

    if ($ip) {
    } else {
     print ERRORFILE $host."\n";
     print CLEANFILE $host.",,,,,,ERROR\n";
     next;
    }

	#  print ("IP  : ".$ip->ip()."\n");
	#  print ("Sho : ".$ip->short()."\n");
	#  print ("Bin : ".$ip->binip()."\n");
	#  print ("Int : ".$ip->intip()."\n");
	#  print ("Mask: ".$ip->mask()."\n");
	#  print ("Last: ".$ip->last_ip()."\n");
	#  print ("Len : ".$ip->prefixlen()."\n");
	#  print ("Size: ".$ip->size()."\n");
	#  print ("Type: ".$ip->iptype()."\n");
	#  print ("Rev:  ".$ip->reverse_ip()."\n");

    	my $first = $ip->ip();
	my $last = $ip->last_ip();
	my $type = $ip->iptype();
	my $version = $ip->version();
	my $numhosts = $ip->size();
	my $netmask = $ip->mask();

	print CLEANFILE $host.",".$version.",".$numhosts.",".$netmask.",".$first.",".$last.",".$type."\n";
  }
	
print "writing targets.csv\n";
print "Done!\n"; 