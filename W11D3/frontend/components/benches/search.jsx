import React from 'react';
import BenchMap from "./bench_map";
import BenchIndex from "./bench_index"

export const Search = function (props) {
    return (
        <div>

            <BenchMap/>
            <BenchIndex fetchBenches={props.fetchBenches} benches={props.benches}/>

        </div>
    )
}
