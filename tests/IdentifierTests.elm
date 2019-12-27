module IdentifierTests exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)

import Identifier

suite : Test
suite =
    describe "Identifier"
      [ describe "toString"
        [ test "Can convert an Identifier to a String" <|
          \_ ->
            let result = Identifier.toString { namespace = "namespace"
                                             , collection = "collection"
                                             , identifier = "identifier"
                                             }
            in Expect.equal "namespace:collection:identifier" result

        , test "Resulting String is not hardcoded" <|
          \_ ->
            let result = Identifier.toString { namespace = "a"
                                             , collection = "b"
                                             , identifier = "c"
                                             }
            in
              Expect.equal "a:b:c" result

        ]
      ]
