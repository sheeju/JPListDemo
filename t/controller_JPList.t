use strict;
use warnings;
use Test::More;


use Catalyst::Test 'JPListDemo';
use JPListDemo::Controller::JPList;

ok( request('/jplist')->is_success, 'Request should succeed' );
done_testing();
