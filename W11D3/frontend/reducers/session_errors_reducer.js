import {RECEIVE_SESSION_ERRORS, RECEIVE_CURRENT_USER} from '../actions/session_actions'
import { bindActionCreators } from 'redux';

export const sessionErrorsReducer = (state = [], action) => {

    Object.freeze(state);

    switch (action.type){
        case RECEIVE_SESSION_ERRORS:
            return action.errors.responseJSON; 
        case RECEIVE_CURRENT_USER:
            return [];
        default:
            return state;
    }
}


///STATE SHAPE///////
/////////////////////
// {
//     entities: {
//         users: { }
//     },
//     session: {
//         id: null,
//   },
//     errors: {
//         session: []
//     }
// }