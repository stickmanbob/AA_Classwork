import Greeting from './greeting';
import {logout} from '../../actions/session_actions';
import {connect} from 'react-redux';

function mapStateToProps (state) {
    let userId = state.session.currentUser;

    return {
        currentUser: state.entities.users[userId]
    };
};

function mapDispatchToProps (dispatch) {
    return {
        logout: () => dispatch(logout())
    }
};

const greeting = connect(mapStateToProps, mapDispatchToProps)(Greeting);

export default greeting; 

