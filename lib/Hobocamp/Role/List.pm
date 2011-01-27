package Hobocamp::Role::List;
BEGIN {
  $Hobocamp::Role::List::VERSION = '0.501';
}

use v5.12.2;
use warnings;

# ABSTRACT: A role for all list like widgets

use Moose::Role;

use Hobocamp::Dialog;

has 'default_item' => (
    'is'      => 'rw',
    'isa'     => 'Str',
    'default' => '',
);

before 'run' => sub {
    my ($self) = @_;

    if ($self->default_item) {
        Hobocamp::Dialog::_set_default_list_item($self->default_item);
    }
};

after 'run' => sub {
    Hobocamp::Dialog::_set_default_list_item('');
};

no Moose::Role;

1;


__END__
=pod

=head1 NAME

Hobocamp::Role::List - A role for all list like widgets

=head1 VERSION

version 0.501

=head1 SYNOPSIS

    package Some::Thing;

    use Moose;

    with 'Hobocamp::Role::Widget';

=head1 DESCRIPTION

Provides information and functionality to any of dialog's widgets.

=head1 AUTHOR

Adam Flott <adam@npjh.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Adam Flott <adam@npjh.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

