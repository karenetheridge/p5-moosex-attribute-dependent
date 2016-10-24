package MooseX::Attribute::Dependent::Meta::Role::Composite;

use Moose::Role;

around apply_params => sub {
    my $orig = shift;
    my $self = shift;

    $self->$orig(@_);

    $self = Moose::Util::MetaRole::apply_metaroles(
        for            => $self,
        role_metaroles => {
            application_to_class => ['MooseX::Attribute::Dependent::Meta::Role::ApplicationToClass'],
            application_to_role => ['MooseX::Attribute::Dependent::Meta::Role::ApplicationToRole'],
        },
    );

    return $self;
};

no Moose::Role;

1;
