import React from "react";

export default class Weather extends React.Component {
    constructor(){
        super();
        
    }
    componentDidMount(){
        navigator.geolocation.getCurrentPosition(this.getWeather)
    }

    getWeather(location){
        let lon = location.coords.longitude;
        let lat = location.coords.latitude;
        let apiKey = "df047a52b3a84b5bdc1ec47a427bfe60"
        $.ajax({
            url: `api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${apiKey}`
        }).then( 
            function(res){console.log(res.main.temp)});
    }


    // api.openweathermap.org/data/2.5 / weather ? lat = { lat } & lon={ lon }& appid={ your api key }

    render(){
        return null;
    }
}