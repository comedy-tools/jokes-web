module Identifier exposing ( Identifier
                           , toString
                           , parse
                           )

type alias Identifier = { namespace: String
                        , collection: String
                        , identifier: String
                        }

toString : Identifier -> String
toString id = id.namespace ++ ":"
              ++ id.collection ++ ":"
              ++ id.identifier


parse : String -> Maybe Identifier
parse str =
  let
    components = List.filter isNotEmptyOrBlank (String.split ":" str)
  in
    case components of
      [namespace, collection, identifier] ->
        Just { namespace = namespace
             , collection = collection
             , identifier = identifier
             }
      _ -> Nothing


isNotEmptyOrBlank : String -> Bool
isNotEmptyOrBlank = not << String.isEmpty << String.trim
