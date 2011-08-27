#!/usr/bin/env perl

$bounce=6;

if(open(myfile,"/var/qmail/scanner/mailstats.csv"))
{
 $line=<myfile>;
  while($line ne "")
  {
   @array=split(/\t/,$line);
   $score= @array[2];
    if($score >$bounce)
    {
     print $line;
     print "\n";
     }
   $line=<myfile>;
   }
}
else
{
print "file open failed";
}
