import {connect} from "react-redux";
import {Search} from './search';

function mapStatetoProps(state) {
    return {
        benches: state.entities.benches
    };
};

function mapDispatchtoProps(dispatch) {
    return {
        fetchBenches: () => dispatch(fetchBenches())
    };
};

export default connect(
    mapStatetoProps,
    mapDispatchtoProps
)(Search);