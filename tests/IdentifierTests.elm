module IdentifierTests exposing (suite)

import Expect exposing (Expectation)
import Test exposing (..)

import Identifier exposing (Identifier)

-- An unchecked method for constructing a new identifier.
newIdentifier : String -> String -> String -> Identifier
newIdentifier n c i = { namespace = n, collection = c, identifier = i }

suite : Test
suite =
    describe "Identifier"
      [ testToString
      , testParse
      ]

testToString : Test
testToString =
  describe "toString"
    [ test "Can convert an Identifier to a String" <|
        \_ ->
          let result = Identifier.toString (newIdentifier "na" "co" "id")
          in
            Expect.equal "na:co:id" result

    , test "Resulting String is not hardcoded" <|
        \_ ->
          let result = Identifier.toString (newIdentifier "a" "b" "c")
          in
            Expect.equal "a:b:c" result
    ]

testParse : Test
testParse =
  describe "parse"
    [ test "Empty string returns Nothing" <|
        \_ -> Expect.equal Nothing (Identifier.parse "")
    , describe "Well-formed identifiers"
      [ test "are parsed correctly" <|
        \_ ->
          let
            expected = Just (newIdentifier "m" "l" "h")
            actual = Identifier.parse "m:l:h"
          in Expect.equal expected actual
      , test "are not parsed to a hardcoded value" <|
        \_ ->
          let
            expected = Just (newIdentifier "z" "zz" "zzz")
            actual = Identifier.parse "z:zz:zzz"
          in Expect.equal expected actual
      ]
    , test "Two component identifier returns Nothing" <|
        \_ -> Expect.equal Nothing (Identifier.parse "a:b")
    , test "String with an empty component returns nothing" <|
        \_ -> Expect.equal Nothing (Identifier.parse "a::b")
    ]
