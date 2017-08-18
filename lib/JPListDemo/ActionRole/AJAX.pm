#
# lib/JPListDemo/ActionRole/AJAX.pm
#
# Developed by Sheeju Alex <sheeju@exceleron.com>
# Copyright (c) 2014 Exceleron Inc
# All rights reserved.
#
# Changelog:
# 2014-07-21 - created
#

package JPListDemo::ActionRole::AJAX;

use Moose::Role;
use Data::Dumper;

# Check for an AJAX request and validate the method
around execute => sub {
    my $orig = shift;
    my $self = shift;
    my ($controller, $c) = @_;

    # Make sure this is an AJAX request
    my $hdr_accept     = $c->req->header('Accept')           || '';
    my $hdr_x_req_with = $c->req->header('X-Requested-With') || '';
    if ( $hdr_accept ne 'application/json' && $hdr_x_req_with ne 'XMLHttpRequest')
    {
        $c->stash->{ajax} = 0;
        return $self->$orig(@_);
    }

    # Mark as AJAX request
    $c->stash->{ajax} = 1;

    # Set up error handler
    $c->stash->{error_handler} = sub {
        my ($c, $error) = shift;

        $c->try_error_redirect;

        $c->res->status(200);

        # Hand to JSON to process the view
        $c->view('JSON')->process($c);
    };
	$c->log->debug("In around execute of AR AJAX: ".$c->stash->{ajax});

    # Continue normal processing
    return $self->$orig(@_);
};

# ========================================================================== #

# Dispatch AJAX request to JSON view
after execute => sub {
    my ($self, $controller, $c) = @_;

	$c->log->debug("In after execute of AR AJAX: ".$c->stash->{ajax});

    # Ignore non-AJAX requests
    return unless $c->stash->{ajax} == 1;

    # Set the cache headers
	#$c->dont_cache;

	$c->log->debug(Dumper($c->stash));

    # Send to JSON view
    $c->detach('View::JSON');
};

1;

__END__

=head1 NAME

AJAX - <<<description of module>>>

=head1 SYNOPSIS

  use AJAX;

  my $xxx = new AJAX;

=head1 DESCRIPTION

The AJAX module allows you ...
<<<your description here>>>

=head2 EXPORT

<<here describe exported methods>>>

=head1 SEE ALSO

=head1 AUTHORS

Sheeju Alex, <sheeju@exceleron.com>

=cut

# vim: ts=4
# vim600: fdm=marker fdl=0 fdc=3

