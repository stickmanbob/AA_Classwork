import {combineReducers} from 'redux';

import {usersReducer} from './users_reducer';

import benchesReducer from './benches_reducer';

export const entitiesReducer = combineReducers (
    {
        users: usersReducer,
        benches: benchesReducer
    }
)