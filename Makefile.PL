use ExtUtils::MakeMaker;
use Config;

$LDDLFLAGS = '';
$LDDLFLAGS = '-all_load' if $^O eq 'darwin';
$LDDLFLAGS = '-L/usr/pkg/lib' if $^O eq 'netbsd';

if ($^O =~ /win32/i) {
        $LIBS = '-logg_static -lvorbis_static -lvorbisfile_static';
} else {
        $LIBS = '-logg -lvorbis -lvorbisfile';
}

WriteMakefile(
	'NAME'		=> 'Ogg::Vorbis::Decoder',
	'VERSION_FROM'	=> 'Decoder.pm',
	'LIBS'		=> [$LIBS],
	'DEFINE'	=> '-O',
	'LDDLFLAGS'	=> "$Config{'lddlflags'} $LDDLFLAGS"
);
