package JPListDemo::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=encoding utf-8

=head1 NAME

JPListDemo::Controller::Root - Root Controller for JPListDemo

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    # Hello World
    $c->response->body( $c->welcome_message );
}


=head2 demo

The root page (/)

=cut

sub demo :Local :Args(0) {
    my ( $self, $c ) = @_;

    opendir(DIR, $c->path_to(qw/root demo/));
	my @files = grep(/\.html$/,readdir(DIR));
	closedir(DIR);

	my $html;
	foreach my $file ( sort {$a cmp $b} @files ) {
	   $html .= "<a href='/demo/$file'>$file</a></br>";
	}

    # Hello World
    $c->response->body($html);
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Sheeju Alex,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
