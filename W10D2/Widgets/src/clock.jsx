import React from 'react';

export default class Clock extends React.Component {
    constructor() {
        super();
        this.state = {time: new Date()};
        this.tick = this.tick.bind(this); 
    }

    render () {
        return (
            <div>
                <h1>The Clock</h1>
                <section className="clock">
                    <span>Time: {this.state.time.getHours()}:{this.state.time.getMinutes()}:{this.state.time.getSeconds()}</span>
                    <span>Date: {this.state.time.getMonth()} {this.state.time.getUTCDate()} {this.state.time.getUTCFullYear()}</span>
                </section>
            </div>   
        )
    }

    componentDidMount () {
        this.timer = setInterval(this.tick, 1000);
    }

    componentWillUnmount () {
        clearInterval(this.timer);
    }

    tick() {
        this.setState({time: new Date()});
    }
}