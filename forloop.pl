#!/usr/bin/perl

use strict;
use warnings;

BEGIN {
    sub forloop (\@&) {
        my ($arrayref, $coderef) = @_;
        
        my $iterator = 0;
        
        foreach my $item ( @{ $arrayref } ) {
            $iterator++;
            &$coderef( $item, $iterator );
        }
        
        return 1;
    }
}

my @testarray = qw{ one two three four five };

#works 

forloop @testarray, sub {
    my ($item, $iterator) = @_;
    
    print "item: $item, iterator: $iterator\n";
};

# Want to be able to 'forloop @array { print "$iterator\n" };
# I don't think the Perl parser will allow it.
# Also don't know of a way to inject a variable into
# an anonymous sub except @_;






