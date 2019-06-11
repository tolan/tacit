import "bootstrap";
import Chartkick from "chartkick"
import Chart from "chart.js"

Chartkick.use(Chart)
// use built in chartkick method method

// index chart
const chart_index = document.querySelector('#chart-1');
const data_index = chart_index.dataset.index;
const parsed_data_index = JSON.parse(data_index)
new Chartkick.LineChart("chart-1", parsed_data_index, {colors: ["#FFE8DC", "#004BB4"], xmin: "2018-01-01", xmax: Date.today, points: false, suffix: "€", thousands: " "} )
