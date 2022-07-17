

let weather = {
    getWeather: function (city) {
        fetch(
            "https://api.openweathermap.org/data/2.5/weather?q=" +
            city +
            "&units=metric&appid=" +
            "a0240d3b15761d5c6724e2b91e3231ab"
        )
            .then((response) => {
                if (!response.ok) {
                    alert("No weather found. "+city);
                    throw new Error("No weather found.");
                }
                return response.json();
            })
            .then((data) => this.displayWeather(data,city));
    },
    displayWeather: function (data,city) {
        const { name } = data;
        const { icon, description } = data.weather[0];
        const { temp, humidity } = data.main;
        const { speed } = data.wind;
        document.querySelector(".city").innerText =city + "    ";
        document.querySelector(".temp").innerText = Math.ceil(temp) + "°C   ";
    },

};


weather.getWeather("Sylhet");