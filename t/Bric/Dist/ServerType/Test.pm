package Bric::Dist::ServerType::Test;
use strict;
use warnings;
use base qw(Bric::Test::Base);
use Test::More;
use Bric::Dist::ServerType;

##############################################################################
# Test the constructor.
##############################################################################
sub test_const : Test(10) {
    my $self = shift;
    my $args = { name        => 'Bogus',
                 description => 'Bogus ServerType',
                 move_method => 'File System',
                 site_id     => 100,
               };

    ok ( my $st = Bric::Dist::ServerType->new($args), "Test construtor" );
    ok( ! defined $st->get_id, 'Undefined ID' );
    is( $st->get_name, $args->{name}, "Name is '$args->{name}'" );
    is( $st->get_description, $args->{description},
        "Description is '$args->{description}'" );
    is( $st->get_site_id, 100, "Check site ID is '$args->{site_id}'" );
    is( $st->get_move_method, $args->{move_method},
        "Move method is '$args->{move_method}'" );
    ok( $st->is_active, "Check that it's activated" );
    ok( $st->can_publish, "Check can publish" );
    ok( !$st->can_preview, "Check can't preview" );
    ok( !$st->can_copy, "Check can't copy" );
}

1;
__END__
