import './style.css';
import 'ol/ol.css';
import Map from 'ol/Map';
import View from 'ol/View';
import TileLayer from 'ol/layer/Tile'; // Используем TileLayer для WMS
import OSM from 'ol/source/OSM';
import TileWMS from 'ol/source/TileWMS'; // Используем TileWMS
import { fromLonLat } from 'ol/proj';

const map = new Map({
  target: 'map',
  layers: [
    new TileLayer({
      source: new OSM()
    }),
    // Рекомендуется объединять слои одного сервера в один запрос для производительности
    new TileLayer({
      source: new TileWMS({
        url: 'http://localhost:8080/geoserver/gis/wms',
        params: {
          // Убрали лишние пробелы и объединили слои через запятую
          'LAYERS': 'gis:buildings,gis:roads,gis:poi',
          'TILED': true
        },
        serverType: 'geoserver',
        transition: 0
      })
    })
  ],
  view: new View({
    center: fromLonLat([49.2826899, 53.6001943]),
    zoom: 14
  })
});
