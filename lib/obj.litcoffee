## ColdObject

ColdObject handles the MOP:

- CRUD parent
- CRUD objectVar
- CRUD method
- receive message

To avoid making One Huge Object we (will eventually) delegate inheritance,
vars, methods and messages to utility objects.

Also, since world state is versioned by the db, so to is object state.

    {WithRoles} = require 'role'

    Inheritor = require './inheritor'
    ColdVars = require './var'
    MessageReceiver = require './msg-receiver'

    class ColdObject extends WithRoles

    ColdObject[WithRoles.sym].addRoles Inheritor, ColdVars, MessageReceiver

    ignored:
      addChild: (child) ->

      parentMethodCollisions: (parent) ->
        _.intersection @allMethods(), parent.allMethods()

      addParent: (parent) ->
        if @parentMethodCollisions(parent).length
          throw new Error '..'

        for method in parent.allMethods()
          @inheritedMethods[method.name] = method

