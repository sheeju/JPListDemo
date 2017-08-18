package JPListDemo::Controller::JPList;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

JPListDemo::Controller::JPList - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 datasources

=cut

sub datasources :Local :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash->{template} = 'site/datasources.tt';
}

#datasourcesexamples/php-mysql-json-handlebars-demo

=head2 datasourcesexamples

=cut

sub datasourcesexample :Path('datasourcesexample/perl-json-demo') :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash->{template} = 'site/datasourcesexample.tt';
}

=encoding utf8

=head1 AUTHOR

Sheeju Alex,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
