package Game;

use Mouse;

use constant {
    ERR_ALREADY_REGISTERED => 'ERR_ALREADY_REGISTERED',
};

has max_users => (
    is => 'ro',
    isa => 'Int',
    required => 1,
);

has users => (
    is => 'ro',
    isa => 'HashRef',
    default => sub { return {} }
);

sub register_user {
    my ($self, $email) = @_;

    if (exists $self->users->{$email}) {
        return undef, ERR_ALREADY_REGISTERED()
    }

    my $user = {};
    $self->users->{$email} = $user;

    return $user, undef
}


1;
