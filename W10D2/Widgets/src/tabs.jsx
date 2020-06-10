import React from 'react';

export default class Tab extends React.Component {
    constructor(props) {
        super();
        this.state = {currentTab: 0}
        this.tabs = props.tabs;
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick (e) {
        e.preventDefault();
        let target = e.target;
        // debugger

        let prevTab = document.querySelector(".selected-tab");  
        if (prevTab) { prevTab.classList.remove("selected-tab")}; 
        this.setState({ currentTab: parseInt(target.dataset.index) }, () => (target.classList.add("selected-tab")));
    }

    // selectTab(target) {
    //    return () => (target.classList.add("selected-tab"));
    // }
    
    componentDidMount () {
        let tabHeaders = document.getElementById("tab-headers");
        tabHeaders.addEventListener("click", this.handleClick);
    }

    render () {
        return (
            <div className="tabs-widget">
                <h1>Tabs</h1>
                <ul id="tab-headers">
                    {this.tabs.map((tab,idx)=>{
                       return <h1 key={idx} data-index={idx}>{tab.title}</h1>
                    })}
                </ul>

                <article className ="tab-content">
                    <p>{this.tabs[this.state.currentTab].content}</p>
                </article>
            </div>

        );
    }


}