import { connect } from 'react-redux';
import { signup } from '../../actions/session_actions'
import SessionForm from "./SessionForm";
function mapStatetoProps(state, ownProps) {

    return {
        errors: state.errors.session,
        formType: "signup"
    }
}

function mapDispatchtoProps(dispatch, ownProps) {
    return {
        processForm: (user) => dispatch(signup(user))
    }
}

export const SignupFormContainer = connect(mapStatetoProps, mapDispatchtoProps)(SessionForm);