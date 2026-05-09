import './style.css'
import 'ol/ol.css';
import Map from 'ol/Map';
import View from 'ol/View';
import TileLayer from 'ol/layer/Tile';
import VectorLayer from 'ol/layer/Vector';
import VectorSource from 'ol/source/Vector';
import OSM from 'ol/source/OSM';
import GeoJSON from 'ol/format/GeoJSON';
import { fromLonLat } from 'ol/proj';
import { stylefunction } from 'ol-mapbox-style';
import TileWMS from 'ol/source/TileWMS';

const overtureSource = new VectorSource({
  url: 'output.json',
  format: new GeoJSON(),
});

const overtureLayer = new VectorLayer({ source: overtureSource });

fetch('style.json')
  .then((r) => r.json())
  .then((style) => stylefunction(overtureLayer, style, 'overture'));

new Map({
  target: 'map',
  layers: [
    new TileLayer({ source: new OSM() }),
     new TileLayer({
      source: new TileWMS({
        url: 'http://localhost:8080/geoserver/gis/wms',
        params: {
          'LAYERS': 'gis:buildings,gis:roads,gis:poi',
          'TILED': true
        },
        serverType: 'geoserver',
        transition: 0
      })
    }),
    overtureLayer,
  ],
  view: new View({
    center: fromLonLat([49.2826899, 53.6001943]),
    zoom: 14,
  }),
});

