#!/usr/bin/perl
# $Id: cloud-init.pl,v 1.3 2018/04/18 09:05:00 ubuntu Exp ubuntu $

# Construct a temp file name with the date and PID
my $tempFileName,$sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst;
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
$tempFileName = sprintf("/tmp/aws-meta-%04d-%02d-%02d-%02d-%02d-%02d-%d.txt",
 $year+1900,$mon+1,$mday,$hour,$min,$sec,$$);

qx(/var/www/aws/ec2-user-data.bash > $tempFileName);     # Capture ec2 user data

open (CONFIG, $configFile)                             # Open configuration file
 or                                                    # or report error and end
  die "Run time error: $0\nConfiguration file: $configFile NOT opened!\n$!\n\n";

our %cA = loadConfigHash(); # Load Configuration Parameters hash!
close(CONFIG);

my $updateFile = '/var/www/aws/html/index.html';
open (CONFIG, $updateFile)                             # Open configuration file
 or                                                    # or report error and end
  die "Run time error: $0\nConfiguration file: $updateFile NOT opened!\n$!\n\n";

our %cB = loadConfigHash(); # Load Configuration Parameters hash!
close(CONFIG);

print "
  instance-type: $cB{'instance-type'}
              -> $cA{'instance-type'}

public-hostname: $cB{'public-hostname'}
              -> $cA{'public-hostname'}
    public-ipv4: $cB{'public-ipv4'}
              -> $cA{'public-ipv4'}

 local-hostname: $cB{'local-hostname'}
              -> $cA{'local-hostname'}
     local-ipv4: $cB{'local-ipv4'}
              -> $cA{'local-ipv4'}
";

updateFile($updateFile);
updateFile('/var/www/aws/aws_apache2.conf');
# ..:....|....:....|....:....|....:....|....:....|....:....|....:....|....:....|
sub updateFile { # Update specified file.
my $fileName = my $textFileString = ''; my $parameterCount = @_;
if ($parameterCount > 0) {$fileName = shift}
if(-e $fileName) { # test existance
     open(READ_FILE, $fileName) or die
 "Run time error: $0\nFile: $fileName NOT opened for reading!\n$!\n\n";

     while(<READ_FILE>) {$textFileString .= $_ } close(READ_FILE);

$textFileString =~ s/$cB{'public-hostname'}/$cA{'public-hostname'}/g;

$textFileString =~ s/$cB{'public-ipv4'}/$cA{'public-ipv4'}/g;

$textFileString =~ s/$cB{'local-hostname'}/$cA{'local-hostname'}/g;

$textFileString =~ s/$cB{'local-ipv4'}/$cA{'local-ipv4'}/g;

$textFileString =~ s/$cB{'instance-type'}/$cA{'instance-type'}/g;

open (UPDATEFILE, ">$fileName")
 or
  die "Run time error: $0\nPage: $fileName NOT opened for update!\n$!\n\n";

print UPDATEFILE $textFileString;

close(UPDATEFILE);

} else {die
 "Run time error: $0\nFile: $fileName NOT found!\n$!\n\n";}

return}

# ..:....|....:....|....:....|....:....|....:....|....:....|....:....|....:....|
sub loadConfigHash { my %configParameter = (); # Define a hash!

# modified from Perl Cookbook 8.16 Reading Configuration files

while(<CONFIG>) {          # Load parameters from configuration file into a hash
    chomp;        # strip newline
    s/#.*//;      # strip comments
    s/^\s+//;     # strip leading white space
    s/\s+$//;     # strip trailing white space
    next unless length; # skip empty lines
    last unless not m/Report AWS EC2 user-data for this instance/;
    my ($var, $value) = split(/\s*:\s+/, $_, 2);
    $configParameter{$var} = $value;
}                    # End - Load parameters from configuration file into a hash
return %configParameter
}
# ..:....|....:....|....:....|....:....|....:....|....:....|....:....|....:....|

