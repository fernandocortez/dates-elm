module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (type_)
import Html.Events exposing (onInput)


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias Model =
    { date : String
    , datetime : String
    }


model : Model
model =
    { date = ""
    , datetime = ""
    }



-- UPDATE


type Msg
    = ChangeDate String
    | ChangeDateTime String


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeDate date ->
            { model | date = date }

        ChangeDateTime datetime ->
            { model | datetime = datetime }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ h2 [] [ text "Date" ]
            , input [ type_ "date", onInput ChangeDate ] []
            , p
                []
                [ text model.date ]
            ]
        , div []
            [ h2 [] [ text "Date and Time" ]
            , input [ type_ "datetime-local", onInput ChangeDateTime ] []
            , p
                []
                [ text model.datetime ]
            ]
        ]
