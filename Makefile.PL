require 5.002;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME	 => 'rlib',
    VERSION_FROM => 'rlib.pm',
    dist         => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
);
