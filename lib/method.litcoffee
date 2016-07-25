## ColdCoffee

    ColdLang = require './lang'

    ColdCoffee = new ColdLang
      compiler: (code) ->

## Method

    class ColdMethod
      constructor: (info) ->
        { @definer, @name
          @argNames = []
          @code = ""
          @compile = ColdCoffee.compiler
          @fn = @compile @code
        } = info

