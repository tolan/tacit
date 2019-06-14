import "bootstrap";
import Chartkick from "chartkick"
import Chart from "chart.js"

Chartkick.use(Chart);
// use built in chartkick method method

// index chart
if (document.querySelector('#chart-1')){
  const chart_index = document.querySelector('#chart-1');
  const data_index = chart_index.dataset.index;
  const parsed_data_index = JSON.parse(data_index)
  new Chartkick.LineChart("chart-1", parsed_data_index, {colors: ["#FFE8DC", "#004BB4"], xmin: "2018-01-01", xmax: Date.today, points: false, suffix: "€", thousands: " ",
    dataset: {
      backgroundColor: "rgba(0, 75, 180, 0.6)",
    }
  })
}



// // show chart
if (document.querySelector('#chart-2')){
  const chart_show = document.querySelector('#chart-2');
  const data_show = chart_show.dataset.show;
  const parsed_data_show = JSON.parse(data_show)
  new Chartkick.LineChart("chart-2", parsed_data_show, {
    colors: ["#004BB4", "#FF7676"], points: false, suffix: "€", thousands: " ", legend: "bottom", defer: true,
      dataset: {
        legend: {
          display: false,
        }
      }
    })
  };

  var slideout = new Slideout({
          'panel': document.getElementById('panel'),
          'menu': document.getElementById('menu'),
          'padding': 256,
          'tolerance': 70
        });


// Toggle button
     document.querySelector('.hamburger').addEventListener('click', function() {
       slideout.toggle();
       $(".hamburger").toggleClass("active");
     });

