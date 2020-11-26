package MyModule::Test;

use Test::Class::Moose;



no Test::Class::Moose;
__PACKAGE__->meta->make_immutable();
