#!perl -w

require 5.006;
use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME => 'HTTP::Headers',
    DISTNAME => 'HTTP-Headers',
    VERSION_FROM => 'lib/HTTP/Headers.pm',
    ABSTRACT => 'Class encapsulating HTTP Message headers',
    AUTHOR => 'Gisle Aas <gisle@activestate.com>',
    LICENSE => "perl",
    MIN_PERL_VERSION => 5.006,
    PREREQ_PM => {
        # MIME::Base64 has been in the core since Perl 5.8.
        # It is only really needed if you use the "Basic Auth" features
        'MIME::Base64'   => "2.1",
    },
    META_MERGE => {
        # recommends => {
        # },
        # resources => {
        #    repository => 'http://gitorious.org/projects/libwww-perl',
        #    MailingList => 'mailto:libwww@perl.org',
        #    }
    },
);

BEGIN {
    # compatibility with older versions of MakeMaker
    my $developer = -f "NOTES.txt";
    my %mm_req = (
        LICENCE => 6.31,
        META_MERGE => 6.45,
        META_ADD => 6.45,
        MIN_PERL_VERSION => 6.48,
    );
    undef(*WriteMakefile);
    *WriteMakefile = sub {
        my %arg = @_;
        for (keys %mm_req) {
            unless (eval { ExtUtils::MakeMaker->VERSION($mm_req{$_}) }) {
                warn "$_ $@" if $developer;
                delete $arg{$_};
            }
        }
        ExtUtils::MakeMaker::WriteMakefile(%arg);
    };
}
