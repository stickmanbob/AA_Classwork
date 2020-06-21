import { connect } from 'react-redux';
import { fetchBenches } from '../../actions/bench_actions';
import BenchIndex from "./bench_index.jsx";

function mapStatetoProps (state) {
    return {
        benches: state.entities.benches
    };
};

function mapDispatchtoProps (dispatch) {
    return {
        fetchBenches: () => dispatch(fetchBenches())
    };
};

export default connect(
    mapStatetoProps,
    mapDispatchtoProps
)(BenchIndex);