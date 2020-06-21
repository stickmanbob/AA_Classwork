import React from 'react'
import { BenchIndexItem } from "./bench_index_item"

export default class BenchIndex extends React.Component {

    constructor(props) {
        super(props);
         
    }

    componentDidMount() {
        
        // request benches from your API here
        this.props.fetchBenches();
    }

    render() {
        
        let benches = "" 
        if(Object.values(this.props.benches)){
            benches = Object.values(this.props.benches).map((bench, idx) => {
                return <BenchIndexItem bench={bench} key={idx} />
            })
        }
        return (
        <>
            <ul>
                {benches} 
            </ul>
        </>
        )
    }
}