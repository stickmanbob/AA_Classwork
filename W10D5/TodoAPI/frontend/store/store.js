import {createStore} from 'redux';

import rootReducer from "../reducers/root_reducer";

const configureStore = function(preloadedState = {}){
    return createStore(rootReducer, preloadedState);
};

export default configureStore; 