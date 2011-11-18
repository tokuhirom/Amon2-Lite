use strict;
use warnings;
use Module::Build;

my $build = Module::Build->new(
    license              => 'perl',
    dynamic_config       => 0,

    build_requires       => {
        'Test::More' => '0.98',
        'Test::Requires' => 0,
    },
    configure_requires   => { 'Module::Build' => '0.38' },
    requires             => {
        'Amon2'                         => '3.25',
        'Data::Section::Simple'         => '0.03',
        perl                            => '5.008008',
        'Text::Xslate::Bridge::TT2Like' => '0.00010',
        'Router::Simple'                => '0.06',
    },

    no_index    => { 'directory' => [ 'inc' ] },
    name        => 'Amon2-Lite',
    module_name => 'Amon2::Lite',

    # script_files => [''],

    test_files => (-d '.git' || $ENV{RELEASE_TESTING}) ? 't/ xt/' : 't/',
    recursive_test_files => 1,
   
    create_readme  => 1,
    create_license => 1,
);
$build->create_build_script();
