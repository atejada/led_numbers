module LED_Numbers where

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import StartApp.Simple as StartApp
import String exposing (toInt,toList)
import Dict

--MODEL
type alias Model =
  { 
    number: String,
    leds: Dict.Dict Char (List String),
    line: String
  }

initialModel: Model
initialModel = 
  {
    number = "",
    leds = Dict.fromList[('0',[" _  ","| | ","|_| "]),('1',["  ","| ","| "]),
                         ('2',[" _  "," _| ","|_  "]),('3',["_  ","_| ","_| "]),
                         ('4',["    ","|_| ","  | "]),('5',[" _  ","|_  "," _| "]),
                         ('6',[" _  ","|_  ","|_| "]),('7',["_   "," |  "," |  "]),
                         ('8',[" _  ","|_| ","|_| "]),('9',[" _  ","|_| "," _| "])],
    line = ""
  }

--UPDATE
fromJust : Maybe a -> a
fromJust x = case x of
  Just y -> y
  Nothing -> Debug.crash ""

fromMaybe : Maybe (List String) -> List String
fromMaybe x = case x of
  Just y -> y
  Nothing -> Debug.crash ""

fromMaybeChar : Maybe Char -> Char
fromMaybeChar x = case x of
  Just y -> y
  Nothing -> Debug.crash ""

get_elem : List a -> Int -> Maybe a
get_elem lst n =
  List.head (List.drop n lst)

fromMaybeListChar : Maybe (List Char) -> List Char
fromMaybeListChar x = case x of
  Just y -> y
  Nothing -> Debug.crash ""

get_list: String -> List Char
get_list str =
  String.toList str

type Action = NoOp | Submit | UpdateNumber String

update: Action -> Model -> Model
update action model =
  case action of
    NoOp ->
      model
    UpdateNumber contents ->
      { model | number = contents }  
    Submit ->
      { model | 
          line = get_led (get_list model.number) 0 model,
          number = ""
      }

get_led: List Char -> Int -> Model -> String
get_led lst n model =
  if List.length lst > 0
  then let h = fromMaybeChar(List.head lst)
           t = fromMaybeListChar(List.tail lst)
           leds = model.leds
           line = Dict.get h leds
       in fromJust(get_elem (fromMaybe line) n) ++ get_led t n model
  else if n < 2
  then "" ++ "\n" ++ get_led (get_list model.number) (n+1) model
  else if n == 2
  then "" ++ "\n"
  else ""

--VIEW
buttonStyle: Attribute
buttonStyle = 
  style
    [ ("outline", "none"),
      ("border", "none"),
      ("border-radius","4px"),
      ("margin-right","5px"),
      ("padding","4px 10px"),
      ("background","#61a1bc"),
      ("color","#fff")
    ]

divStyle: Attribute
divStyle = 
  style
    [ ("margin", "50px auto"),
      ("padding", "0px 50px"),
      ("text-align", "center")
    ]

pStyle: Attribute
pStyle = 
  style
    [ ("font-size", "30px") ]

pageHeader : Html
pageHeader = 
  h1 [ ] [text "LED Numbers"]

view: Signal.Address Action -> Model -> Html
view address model = 
  div [ divStyle ]
    [ pageHeader,
      input
        [ 
          type' "text",
          name "number",
          placeholder "Enter a number",
          value model.number,
          on "input" targetValue (\v -> Signal.message address (UpdateNumber v))
        ]
        [ ],
      button [ buttonStyle, onClick address Submit ] [ text "Submit" ],
      pre [ pStyle ]
          [ text (model.line) ]
    ]
    
main: Signal Html
main = 
  StartApp.start { model = initialModel, view = view, update = update }
