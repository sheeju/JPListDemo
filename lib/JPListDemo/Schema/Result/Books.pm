use utf8;
package JPListDemo::Schema::Result::Books;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

JPListDemo::Schema::Result::Books

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Books>

=cut

__PACKAGE__->table("Books");

=head1 ACCESSORS

=head2 Id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: '"Books_Id_seq"'

=head2 Title

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 PurchaseDate

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 Status

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "Id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "\"Books_Id_seq\"",
  },
  "Title",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "PurchaseDate",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "Status",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</Id>

=back

=cut

__PACKAGE__->set_primary_key("Id");


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-08-18 13:28:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sUPzuvnYG8SbfcyCCogX9Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
