package Hobocamp::Role::Window;
BEGIN {
  $Hobocamp::Role::Window::VERSION = '0.500';
}

use v5.12.2;
use warnings;

# ABSTRACT: A role for adjusting windows (back title, ASCII lines, etc)

use Moose::Role;

use Hobocamp::Dialog;

has 'backtitle' => (
    'is'      => 'rw',
    'isa'     => 'Str',
    'default' => '',
    'trigger' => sub {
        my ($self, $new, $old) = @_;
        Hobocamp::Dialog::_dialog_set_backtitle($new);
        $self->redraw;
    }
);

sub redraw {
    if (shift->backtitle) {
        Hobocamp::Dialog::dlg_put_backtitle();
    }

    return;
}

no Moose::Role;

1;

__END__
=pod

=head1 NAME

Hobocamp::Role::Window - A role for adjusting windows (back title, ASCII lines, etc)

=head1 VERSION

version 0.500

=head1 AUTHOR

Adam Flott <adam@npjh.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Adam Flott <adam@npjh.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

