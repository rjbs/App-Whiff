use inc::Module::Install;

all_from      ('lib/App/Whiff.pm');

install_script('bin/whiff');

requires('File::Which'               => 0.000); # minimum unknown

extra_tests;

repository('http://github.com/rjbs/app-whiff');
auto_manifest;

WriteAll();
