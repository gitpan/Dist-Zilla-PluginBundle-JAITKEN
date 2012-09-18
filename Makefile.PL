
use strict;
use warnings;

use 5.010000;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Build your distributions like JAITKEN",
  "AUTHOR" => "James Aitken <jaitken\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Test::More" => "0.96"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dist-Zilla-PluginBundle-JAITKEN",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dist::Zilla::PluginBundle::JAITKEN",
  "PREREQ_PM" => {
    "Dist::Zilla::Plugin::GithubMeta" => "0.28",
    "Dist::Zilla::Plugin::MinimumPerl" => "1.003",
    "Dist::Zilla::Plugin::MinimumPrereqs" => "0.91",
    "Dist::Zilla::Plugin::PrereqsClean" => "0.91",
    "Dist::Zilla::Plugin::ReadmeAnyFromPod" => "0.120120",
    "Dist::Zilla::Plugin::VersionFromModule" => "0.08",
    "Dist::Zilla::Role::PluginBundle::Easy" => "2.101040",
    "Moose" => "0.94"
  },
  "VERSION" => "0.1.2",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



