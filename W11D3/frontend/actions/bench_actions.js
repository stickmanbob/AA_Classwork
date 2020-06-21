import { getBenches } from "../util/bench_api_util";
export const RECEIVE_BENCHES = "RECEIVE_BENCHES";

export const receiveBenches = (benches) => {
    return {
        type:RECEIVE_BENCHES,
        benches: benches
    }
}

export const fetchBenches = () => (dispatch) => getBenches()
.then((res)=> dispatch(receiveBenches(res)));

