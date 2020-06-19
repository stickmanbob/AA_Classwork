import {connect} from 'react-redux';
import {login} from '../../actions/session_actions'
import SessionForm from "./SessionForm";
function mapStatetoProps(state,ownProps){

    return {
        errors: state.errors.session,
        formType: "login"
    }
}

function mapDispatchtoProps (dispatch, ownProps) {
    return {
        processForm: (user) => dispatch(login(user))
    }
}

export const LoginFormContainer =  connect(mapStatetoProps,mapDispatchtoProps)(SessionForm);