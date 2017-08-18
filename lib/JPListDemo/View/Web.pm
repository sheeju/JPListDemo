package JPListDemo::View::Web;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config({
    INCLUDE_PATH => [
        JPListDemo->path_to( 'root', 'src' ),
        JPListDemo->path_to( 'root', 'lib' )
    ],
    PRE_PROCESS  => 'config/main',
    WRAPPER      => 'site/wrapper',
    ERROR        => 'error.tt2',
    TIMER        => 0,
    render_die   => 1,
});

=head1 NAME

JPListDemo::View::Web - Catalyst TTSite View

=head1 SYNOPSIS

See L<JPListDemo>

=head1 DESCRIPTION

Catalyst TTSite View.

=head1 AUTHOR

Sheeju Alex,,,

=head1 LICENSE

This JPListDemo is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

