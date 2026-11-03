module LEDNumbers exposing (main)

import Browser
import Dict exposing (Dict)
import Html exposing (Html, button, div, h1, input, pre, text)
import Html.Attributes exposing (name, placeholder, style, type_, value)
import Html.Events exposing (onClick, onInput)

type alias Model =
    { number : String
    , line : String
    }


initialModel : Model
initialModel =
    { number = ""
    , line = ""
    }


leds : Dict Char (List String)
leds =
    Dict.fromList
        [ ( '0', [ " _ ", "| |", "|_|" ] )
        , ( '1', [ "   ", "  |", "  |" ] )
        , ( '2', [ " _ ", " _|", "|_ " ] )
        , ( '3', [ " _ ", " _|", " _|" ] )
        , ( '4', [ "   ", "|_|", "  |" ] )
        , ( '5', [ " _ ", "|_ ", " _|" ] )
        , ( '6', [ " _ ", "|_ ", "|_|" ] )
        , ( '7', [ " _ ", "  |", "  |" ] )
        , ( '8', [ " _ ", "|_|", "|_|" ] )
        , ( '9', [ " _ ", "|_|", " _|" ] )
        ]

type Msg
    = UpdateNumber String
    | Submit


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateNumber contents ->
            { model | number = contents }

        Submit ->
            { model
                | line = renderLeds model.number
                , number = ""
            }


renderLeds : String -> String
renderLeds number =
    let
        digits =
            number
                |> String.toList
                |> List.filterMap (\char -> Dict.get char leds)

        renderRow index =
            digits
                |> List.map
                    (\rows ->
                        rows
                            |> List.drop index
                            |> List.head
                            |> Maybe.withDefault ""
                    )
                |> String.join " "
    in
    if List.isEmpty digits then
        ""

    else
        List.range 0 2
            |> List.map renderRow
            |> String.join "\n"


view : Model -> Html Msg
view model =
    div
        [ style "margin" "50px auto"
        , style "padding" "0px 50px"
        , style "text-align" "center"
        ]
        [ h1 [] [ text "LED Numbers" ]
        , input
            [ type_ "text"
            , name "number"
            , placeholder "Enter a number"
            , value model.number
            , onInput UpdateNumber
            ]
            []
        , button
            [ style "outline" "none"
            , style "border" "none"
            , style "border-radius" "4px"
            , style "margin-left" "5px"
            , style "padding" "4px 10px"
            , style "background" "#61a1bc"
            , style "color" "#fff"
            , onClick Submit
            ]
            [ text "Submit" ]
        , pre
            [ style "font-size" "30px"
            , style "font-family" "monospace"
            , style "white-space" "pre"
            , style "line-height" "1"
            ]
            [ text model.line ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , update = update
        , view = view
        }
