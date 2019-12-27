module Identifier exposing (Identifier, toString)

type alias Identifier = { namespace: String
                        , collection: String
                        , identifier: String
                        }

toString : Identifier -> String
toString id = id.namespace ++ ":"
              ++ id.collection ++ ":"
              ++ id.identifier
