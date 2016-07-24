# ColdPress object variables

In ColdPress every object has separate state for every role it is built from.
These Role instances use @context.var to access this state. That .var member
is a ColdVar

    {Role} = require 'role'

    class ColdVar extends Role

