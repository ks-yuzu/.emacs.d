#!/usr/bin/env perl
use v5.26;
use warnings;
use diagnostics;

use utf8;
use open IO => qw/:encoding(UTF-8) :std/;

use Path::Tiny;
use Term::ANSIColor;

my @files = path("$ENV{HOME}/.emacs.d/inits")->children;

my %cnt;
my @duplicated_numbers = grep { $cnt{$_}++ >= 1 }
                         map { $_->basename =~ /^(\d+)/ ? $1 : () } @files;

my @warnings;
my @errors;
my %n_total_lines;

my $number_digit = 3;

for my $file ( sort @files ) {
  my $basename = $file->basename;

  my $f_enabled = 1;
  if ( $basename =~ /^(\d{$number_digit,})_.*\.el$/ ) {
  }
  elsif ( $basename =~ /^(\d{$number_digit,})_.*\.el.disabled$/ ) {
    $f_enabled = 0;
  }
  else {
    push @errors, "found an invalid name file: $basename";
    next;
  }

  do { $basename =~ /$_/ and push @errors, "found duplicated numbered files: $basename" }
    for @duplicated_numbers;

  my @lines = $file->lines({chomp => 1});
  $n_total_lines{$f_enabled ? 'enabled' : 'disabled'} += scalar @lines;

  if ( $basename !~ /disabled/ ) {
    push @warnings, map { "found a package loaded by require: $_" }
                    map { /^[^;]*\(require\s+'([^\s)]*)/ ? "$1 (in $basename)" : () } @lines;

    push @warnings, map { "found a package loaded by autoload: $_" }
                    map { /^[^;]*\(autoload\s+'([^\s)]*)/ ? "$1 (in $basename)" : () } @lines;

    if ( $basename =~ /^\d+_package/ ) {
      push @warnings, "found a package setting file without el-get-bundle: $basename"
        if (grep { /el-get-bundle/ } @lines) == 0;
    }
  }

  say sprintf "%-35s %5d %s",
    $basename =~ s/\..*$//r,
    scalar @lines,
    ($f_enabled ? color('green').'enabled' : color('red').'disabled').color('reset');
}

say STDERR '';
say STDERR color('yellow'), "$_", color('reset') for @warnings;
say STDERR color('red'), "$_", color('reset') for @errors;

$n_total_lines{enabled} += qx(wc -l ~/.emacs.d/init.el | cut -d' ' -f1);

say '';
say 'enabled   ', $n_total_lines{enabled};
say 'disnabled ', $n_total_lines{disabled};
say 'total     ', $n_total_lines{enabled} + $n_total_lines{disabled};
