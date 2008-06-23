use inc::Module::Install;

name          ('App-Whiff');
author        ('Ricardo Signes <rjbs@cpan.org>');
license       ('perl');
all_from      ('lib/App/Whiff.pm');

install_script('bin/whiff');

requires('File::Which'               => 0.000); # minimum unknown

extra_tests;

WriteAll();
