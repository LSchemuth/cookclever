import mapboxgl from 'mapbox-gl';

const addCardHover = (map, markers) => {
  const cards = document.querySelectorAll('.recipe-card');
  cards.forEach((card) => {
    card.addEventListener("mouseenter", () => {
      const supermarket = markers.filter(marker => {
        return marker.id === parseInt(card.dataset.supermarketId);
      })[0];
      const popup = new mapboxgl.Popup().setHTML(supermarket.infoWindow);
      const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = `url('${supermarket.image_url}')`;
        element.style.backgroundSize = 'contain';
        element.style.width = '20px';
        element.style.height = '28px';

      const oldPopups = document.querySelectorAll('.mapboxgl-popup')
      oldPopups.forEach(oldPopup => {
        oldPopup.remove();
      });
      new mapboxgl.Popup()
      .setLngLat([ supermarket.lng, supermarket.lat ])
      .setHTML(supermarket.infoWindow)
      .addTo(map);
    });
  });
  console.log(map)
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 50, maxZoom: 13, duration: 0 });
  addCardHover(map, markers);
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');


  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = `url('${marker.image_url}')`;
        element.style.backgroundSize = 'contain';
        element.style.width = '20px';
        element.style.height = '28px';


      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });
    fitMapToMarkers(map, markers);
  console.log(markers);
  }
};

export { initMapbox };
