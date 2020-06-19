import {sessionErrorsReducer} from './session_errors_reducer';
import {combineReducers} from 'redux'

export const errorsReducer = combineReducers(
    {
        session: sessionErrorsReducer
    }
)
