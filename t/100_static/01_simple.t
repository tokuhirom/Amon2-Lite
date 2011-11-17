use strict;
use warnings;
use utf8;
use Test::More;
use Plack::Test;
use Test::Requires qw/HTTP::Request::Common/, 'Data::Section::Simple';

my $app = do {
    use Amon2::Lite;

    get '/' => sub { shift->create_response(200, [], ['OK']) };

    __PACKAGE__->to_app(
        handle_static => 1,
    );
};

test_psgi($app, sub {
    my $cb = shift;

    {
        my $res = $cb->(GET '/');
        is $res->content, 'OK';
    }

    {
        my $res = $cb->(GET '/static/foo');
        is $res->content, "bar\n";
    }

    {
        my $res = $cb->(GET '/robots.txt');
        is $res->content, "DENY *\n";
    }
});

done_testing;

