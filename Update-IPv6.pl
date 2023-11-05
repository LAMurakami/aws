#!/usr/bin/perl
# Update-IPv6.pl

my $numArgs = $#ARGV + 1;
if ($numArgs < 3) {
print "Error: at least three areguments required!\n";
print "Usage: $0 <old> <new> <dir> [dirs]\n\n";
} else {

our $oldValue = shift;
our $newValue = shift;

print "
      public-ipv6: $oldValue
                -> $newValue

";

my $fileName = '';
foreach my $dirarg (2 .. $numArgs) {
   $fileName = shift;
   updateIPv6confFile($fileName);
}
}
# ..:....|....:....|....:....|....:....|....:....|....:....|....:....|....:....|
sub updateIPv6confFile { # Update specified file.

my $fileName = my $textFileString = ''; my $parameterCount = @_;

if ($parameterCount > 0) {$fileName = shift}

if(-e $fileName) { # test existance

  my $openOK = open(READ_FILE, $fileName);
  if ( !$openOK ) {
    warn "Warning: $0\nFile: $fileName NOT opened for reading!\n$!\n\n";
    return;
  }

  while(<READ_FILE>) {$textFileString .= $_ } close(READ_FILE);
  my $originalTextFileString = $textFileString;

  $textFileString =~ s/$oldValue/$newValue/g;

  $openOK = open (UPDATEFILE, ">$fileName");
  if ( !$openOK ) {
    warn "Warning: $0\nFile: $fileName NOT opened for update!\n$!\n\n";
    return;
  }
  if ( $originalTextFileString ne $textFileString ) {
    print "$0: File: $fileName IPv6 Updated!\n\n";
  } else {
    print "$0: File: $fileName IPv6 Unchanged!\n\n";
  }
  print UPDATEFILE $textFileString;
  close(UPDATEFILE);
} else { # test existance
  warn "$0: File: $fileName NOT found!\n$!\n\n";}
  return;
}
# ..:....|....:....|....:....|....:....|....:....|....:....|....:....|....:....|
