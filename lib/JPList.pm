# ========================================================================== #
# lib/JPList.pm  - JPList Main Module
# Copyright (C) 2017 Exceleron Software, LLC
# ========================================================================== #

package JPList;

use Moose;
use namespace::autoclean;

use JPList::Request;

with 'JPList::DB::Config';
with 'JPList::DB::Result';

# ========================================================================== #

=head1 NAME

JPList - JPList Main Module 

=head1 SYNOPSIS

    my $jplist = JPList->new(
                {
                    db_shard_type  => 'System/MDM/Alerts',
                    db_shard_id    => <SHARD_ID>,
                    db_table_name  => <TABLE/VIEW>,
                    fields         => <Custom fields or custom query>,
                    where_fields   => <WHERE FIELDS like UtilityID etc..>,
                    request_params => <JPList request params statuses>
                }
            );

=head1 DESCRIPTION

    my $jplist = JPList->new({});
    $jplist->get_resultset();

=head2 ATTRIBUTES

=over 4

=cut

# ========================================================================== #

has 'request_params' => (
    is       => 'rw',
    isa      => 'Str',
    required => 1,
);

has 'jplist_request' => (
    is      => 'ro',
    isa     => 'JPList::Request',
    builder => '_build_jplist_request',
    lazy    => 1
);

# ========================================================================== #

=head2 methods

=over 4

=cut

# ========================================================================== #

=item C<_build_jplist_request>

Params : NONE

Returns: Object of JPList::Request

Desc   : Decode the Request params and return Object of JPList::Request

=cut

sub _build_jplist_request
{

    my $self = shift;

    my $jplist_req = JPList::Request->new(request_params => $self->request_params);
    $jplist_req->decode_data();
    return $jplist_req;
}

# ========================================================================== #

=item C<get_resultset>

Params : $self->request_params

Returns: Resultset data from table/view based on the request params

Desc   : Resultset data from table/view based on the request params

=cut

sub get_resultset
{
    my $self = shift;

    my $data = $self->_get_resultset($self->jplist_request);

    return $data;
}

1;

__END__

=back
   
=head1 LICENSE

Copyright (C) 2017 Exceleron Software, LLC

=head1 AUTHORS

Sheeju Alex, <sheeju@exceleron.com>

=head1 SEE ALSO

=cut

# vim: ts=4
# vim600: fdm=marker fdl=0 fdc=3
