module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Sudoku exposing (SudokuCell, cell_to_string, create_cell)
import Url exposing (Url)


type alias Model =
    { sudoku : List SudokuCell
    , key : Nav.Key
    }


type Msg
    = NoOp
    | ChangedUrl Url
    | ClickedLink Browser.UrlRequest


view : Model -> Browser.Document Msg
view model =
    { title = "counter"
    , body =
        [ div
            [ class "mx-5 sm:mx-0 sm:mx-auto lg sm:max-w-xl lg:max-w-3xl mt-10 space-x-10" ]
            [ div [ class "grid grid-cols-9 grid-rows-9 gap-2" ]
                (List.map
                    (\x ->
                        div [ class "" ]
                            [ input
                                [ value <| cell_to_string "-" x
                                , class "border-2 w-7 h-7 rounded-md border-indigo-900 p-1 "
                                ]
                                []
                            ]
                    )
                    model.sudoku
                )
            ]
        ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ChangedUrl url ->
            ( model, Cmd.none )

        ClickedLink urlRequest ->
            case urlRequest of
                Browser.External href ->
                    ( model, Nav.load href )

                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


init : flags -> Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    ( { key = key
      , sudoku =
            List.range 1 (9 * 9)
                |> List.map (\_ -> create_cell 0)
      }
    , Cmd.none
    )


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = ChangedUrl
        , onUrlRequest = ClickedLink
        }
