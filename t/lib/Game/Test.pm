package Game::Test;

use Test::Class::Moose bare => 1;

use Test::Exception;
use Test2::Tools::Compare;

use Game;

sub test_game_init {
    my ($test) = @_;

    my $e = Test::Exception::lives_ok(
        sub { Game->new(max_users => 1,) }, 'game init successful'
    );

    warn("Can't init game: ", $e) if $e;
}

sub test_register_user {
    my ($test) = @_;

    my $game = Game->new(max_users => 1);

    my ($u, $err) = $game->register_user('test@example.com');
    is($err, undef, 'register user no errors');
    is($u, {}, 'register new user is empty');
}

no Test::Class::Moose;
__PACKAGE__->meta->make_immutable();
