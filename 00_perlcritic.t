
use Test::More;
use Test::Perl::Critic::Git;

my $mergebase = `git merge-base HEAD origin/master`;
chomp $mergebase;

all_critic_ok( $mergebase => 'HEAD', { diff_only => 1 } );

# all_critic_ok calls done_testing by itself
