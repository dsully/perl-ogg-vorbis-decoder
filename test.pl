#!/usr/bin/perl -w

use Test;
use warnings;

BEGIN { plan tests => 20 };

use Ogg::Vorbis::Decoder;

ok(1);

ok(my $ogg = Ogg::Vorbis::Decoder->open("test.ogg"));
my $buffer;
ok($ogg->sysread($buffer));
ok($ogg->bitrate);
ok($ogg->bitrate_instant);
ok($ogg->streams);
ok($ogg->seekable);
ok($ogg->serialnumber);
ok($ogg->raw_total);
ok($ogg->pcm_total);
ok($ogg->time_total);
ok($ogg->raw_tell);
ok($ogg->pcm_tell);
ok($ogg->time_tell);
ok($ogg->raw_seek(0), 0);
ok($ogg->pcm_seek(0), 0);
ok($ogg->time_seek(0.0), 0);

# test opening from a glob
ok(open FH, "test.ogg" or die $!);
ok($ogg = Ogg::Vorbis::Decoder->open(\*FH));
ok(close(FH));
