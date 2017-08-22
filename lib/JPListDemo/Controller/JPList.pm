package JPListDemo::Controller::JPList;
use Moose;
use namespace::autoclean;
use Data::Dumper;
use JPList;

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

=head2 perlhtmldemo

=cut

sub perlhtmldemo :Path('datasourcesexample/perl-html-demo') :Args(0)  {
    my ( $self, $c ) = @_;

    if ($c->req->method eq 'GET') {
    	$c->stash->{template} = 'site/perl-html-demo.tt';
    } else {

    	my $stash = $c->stash;
    	my $params = $c->req->body_params;

	    my $jplist = JPList->new(
	        {
	            dbh  => $c->model('DB')->schema->storage->dbh,
	            db_table_name  => 'Items',
	            request_params => $params->{statuses}
	        }
	    );

	    my $jp_resultset = $jplist->get_resultset();

	    my $html;
	    foreach (@{$jp_resultset->{data}}) {
	    	$html .= $self->getHTML($_);					
	    }

	    $html = $self->getHTMLWrapper($html, $jp_resultset->{count});

        $c->response->body($html);
    }    
}

sub getHTML {
	my ( $self, $item) = @_;

	my $html = "";

	$html .= "<div class='list-item box'>";	
	$html .= "	<div class='img left'>";
	$html .= "		<img src='/demo/tmp/" . $item->{'Image'} . "' alt='' title=''/>";
	$html .= "	</div>";
		
	$html .= "	<div class='block right'>";
	$html .= "		<p class='title'>" . $item->{'Title'} . "</p>";
	$html .= "		<p class='desc'>" . $item->{'Description'} . "</p>";
	$html .= "		<p class='like'>" . $item->{'Likes'} . " Likes</p>";
    $html .= "		<p class='views'>" . $item->{'ViewsNumber'} . " Views</p>";
	$html .= "		<p class='theme'>" . $item->{'Keyword1'} . ", " . $item->{'Keyword2'} . "</p>";
	$html .= "	</div>";
	$html .= "</div>";

	return $html;
}

sub getHTMLWrapper {
	my ( $self, $itemsHtml, $count) = @_;
	
	my $html = "";
	
	$html .= "<div data-type='jplist-dataitem' data-count='" . $count . "' class='box'>";
	$html .= $itemsHtml;
	$html .= "</div>";		
	
	return $html;
}



=head2 perlhtmldemo

=cut

sub perljsondemo :Path('datasourcesexample/perl-json-demo') :Args(0):Does('AJAX')  {
    my ( $self, $c ) = @_;

    if ($c->req->method eq 'GET') {
    	$c->stash->{template} = 'site/perl-json-demo.tt';
    } else {

    	my $stash = $c->stash;
    	my $params = $c->req->body_params;

	    my $jplist = JPList->new(
	        {
	            dbh  => $c->model('DB')->schema->storage->dbh,
	            db_table_name  => 'Items',
	            request_params => $params->{statuses}
	        }
	    );

	    my $jp_resultset = $jplist->get_resultset();

	    $stash->{count} = $jp_resultset->{count};
        $stash->{data}  = $jp_resultset->{data};
    }    
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