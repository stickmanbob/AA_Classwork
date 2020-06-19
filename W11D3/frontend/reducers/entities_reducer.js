import {combineReducers} from 'redux';

import {usersReducer} from './users_reducer';
// import {sessionReducer} from './session_reducer';

export const entitiesReducer = combineReducers (
    {
        users: usersReducer,
    }
)