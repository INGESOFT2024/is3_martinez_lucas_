import { Dropdown } from "bootstrap";
import { Chart } from "chart.js/auto";

const canvas = document.getElementById('chartVentas');
const ctx = canvas.getContext('2d');
const btnactualizar = document.getElementById('actualizar');

const data = {
    labels: [],
    datasets: [{
        label: 'ventas',
        data: [],
        borderWidth: 5,
        backgroundColor: []
    }]
};

const chartDependencia = new Chart(ctx, {
    type: 'bar',
    data: data,
});

const getEstadisticas = async () => {
    const url = '/is3_martinez_lucas_/API/detalle/estadisticas';
    const config = { method: "GET" };
    const response = await fetch(url, config);
    const data = await response.json();

    if (data) {
        if (chartDependencia.data.datasets[0]) {
            chartDependencia.data.labels = [];
            chartDependencia.data.datasets[0].data = [];
            chartDependencia.data.datasets[0].backgroundColor = [];

            data.forEach(r => {
                chartDependencia.data.labels.push(r.dependencia);
                chartDependencia.data.datasets[0].data.push(r.cantidad);
                chartDependencia.data.datasets[0].backgroundColor.push(generateRandomColor());
            });
        }
    }
    chartDependencia.update();
};

const generateRandomColor = () => {
    const r = Math.floor(Math.random() * 256);
    const g = Math.floor(Math.random() * 256);
    const b = Math.floor(Math.random() * 256);

    const rebColor = `rgb(${r}, ${g}, ${b})`;
    return rebColor;
};

btnactualizar.addEventListener('click', getEstadisticas);