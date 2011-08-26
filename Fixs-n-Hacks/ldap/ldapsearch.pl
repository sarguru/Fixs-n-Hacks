i#!/usr/bin/env perl
use warnings;
use Net::LDAP;

open(userlist, ">>users-group.csv");
$ldap = Net::LDAP->new("YOUR LDAP SERVER ", timeout=>30) or die "connection to ldap server timed out";

$messge = $ldap->bind("LDAP BIND DN", password=>"LDAP BIND PW");

my $inputuid = $ARGV[0];
$search = $ldap->search( filter=>"(uid=$inputuid)", base=>"LDAP SEARCH BASE");

@entries = $search->entries;
my $empid= 0;

foreach $entry  (@entries){
# I am printing some of the details of the users. In case of any additional attributes you need to print you may pass that  to the get_value function.
# For example to get the sn attribute get_value("sn")

 my $uid=  $entry->get_value("uid");
 my $uidn=  $entry->get_value("uidNumber");
 my $cn= $entry->get_value("cn");
 my $empid= $entry->get_value("employeeNumber");
 my $mail= $entry->get_value("mail");


 print userlist ($uid);
 print userlist (",");
 print userlist ($cn);
 print userlist (",");
 print userlist ($empid);
 print userlist (",");
 print userlist ($uidn);
 print userlist (",");
 print userlist ($mail);
 print userlist ("\n");
}
close(userlist);

