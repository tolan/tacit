import "bootstrap";
import Chartkick from "chartkick"
import Chart from "chart.js"


Chartkick.use(Chart)
// use built in chartkick method method

new Chartkick.LineChart("chart-1", JSON.parse(document.querySelector('#chart-1').dataset.xy))
