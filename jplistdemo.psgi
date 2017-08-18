use strict;
use warnings;

use JPListDemo;

my $app = JPListDemo->apply_default_middlewares(JPListDemo->psgi_app);
$app;

