use strict;
use Test qw(plan ok);
require HTTP::Headers;

plan tests => 1;

my $h = HTTP::Headers->new(foo => "bar", foo => "baaaaz", Foo => "baz");
ok($h->as_string_unsorted(), "Foo: bar\nFoo: baaaaz\nFoo: baz\n");

