package Hobocamp::Role::Widget;
BEGIN {
  $Hobocamp::Role::Widget::VERSION = '0.500';
}

use v5.12.2;
use warnings;

# ABSTRACT: A role for all widgets

use Moose::Role;

requires 'run';

use Hobocamp::Dialog;

has 'title' => (
    'is'      => 'ro',
    'isa'     => 'Str',
    'default' => '',
);

has 'prompt' => (
    'is'      => 'ro',
    'isa'     => 'Str',
    'default' => '',
);

has 'width' => (
    'is'      => 'rw',
    'isa'     => 'Int',
    'default' => 0
);

has 'height' => (
    'is'      => 'rw',
    'isa'     => 'Int',
    'default' => 0
);

has 'value' => (
    'is'  => 'rw',
    'isa' => 'Any',
);

sub hide {
    return Hobocamp::Dialog::dlg_clear();
}

sub show {
    return shift->run(@_);
}

sub _get_user_input_result {
    my ($self) = @_;

    return Hobocamp::Dialog::_dialog_result();
}

no Moose::Role;

1;


__END__
=pod

=head1 NAME

Hobocamp::Role::Widget - A role for all widgets

=head1 VERSION

version 0.500

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

