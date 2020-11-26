requires 'Mouse', '2.5.9';
requires 'AnyEvent::HTTP', '2.24.2', git => 'https://github.com/my-mail-ru/perl-AnyEvent-HTTP.git';
requires 'common::sense', '0';

on test => sub {
    requires 'Test::Compile', '0';
    requires 'Mock::Quick', '0';
    requires 'Test::Class::Moose', '0';;

    requires 'UUID::Random';
    requires 'Test2', '0';
    requires 'Test2::Aggregate', '0';
    requires 'Test2::Suite', '0';

    requires 'Test::Perl::Critic::Git', '0', git => 'https://github.com/mrsndmn/Test-Perl-Critic-Git.git', ref => 'dev';
    requires 'Perl::Critic::Moose';
    requires 'Perl::Critic::TooMuchCode';
    requires 'Perl::Critic::StricterSubs';
    requires 'Perl::Critic::Tics';
    requires 'Perl::Critic::Pulp';
    requires 'Perl::Critic::Policy::Dynamic::NoIndirect';
    requires 'Perl::Critic::Policy::Variables::ProhibitUnusedVarsStricter';
    requires 'Perl::Critic::Policy::Variables::ProhibitUselessInitialization';
    requires 'Perl::Critic::Policy::Variables::ProhibitUnusedVarsStricter';
    requires 'Perl::Critic::PolicyBundle::PERLANCAR'
};
