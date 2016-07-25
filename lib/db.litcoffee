## DB

The DB handles the object lifecycle, including persistence and versioning.

    dict = (k, v, pairs...) ->
      (o = {})[k] = v

      if pairs.length
        Object.assign o, dict pairs...

      return o

    accessor = (varName, accessorName = varName) ->
      new ColdMethod
          name: accessorName
          args: (newValue) -> {newValue, modify: arguments.length isnt 0}
          fn: ({newValue, modify}) ->
            if modify
              @cold.set dict varName, newValue
            else
              @cold.get varName


    class ColdDB
      constructor: ->
        @log = []
        @current = {}
        @names = {}
        @_initMinimal()

      _initMinimal: ->
        sys  = @create name: 'sys'
        root = @create name: 'root'

        sys.addParent root

      snapshot: ->
        snap = Object.assign {}, @current

      create: (opts = {}) ->
        {name} = opts

        if name and @lookup name
          throw new Error "Name $#{name} already in use"

        o = new ColdObject {name}

        @addName name, o

        @logChanges [ { newObject: o, id: o.id } ]

        return o

      lookup: (id) ->
        if not o = @objs[id]
          throw new Error "~objnf"

        return o

      destroy: (id) ->
        o = @lookup id
        @dieing[id] = o
        @objs[id] = null

