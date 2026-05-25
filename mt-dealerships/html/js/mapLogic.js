
const center_x = 117.3;
const center_y = 172.8;
const scale_x = 0.02072;
const scale_y = 0.0205;


CUSTOM_CRS = L.extend({}, L.CRS.Simple, {
	projection: L.Projection.LonLat,
	scale: function (zoom) {
		return Math.pow(2, zoom);
	},
	zoom: function (sc) {
		return Math.log(sc) / 0.6931471805599453;
	},
	distance: function (pos1, pos2) {
		var x_difference = pos2.lng - pos1.lng;
		var y_difference = pos2.lat - pos1.lat;
		return Math.sqrt(x_difference * x_difference + y_difference * y_difference);
	},
	transformation: new L.Transformation(scale_x, center_x, -scale_y, center_y),
	infinite: true
});

let map

var mapDealerships = L.tileLayer('./assets/mapStyles/{z}/{x}/{y}.jpg', {
    minZoom: 0,
    maxZoom: 5,
    noWrap: true,
    id: 'styleAtlas map'
});
function initMap(dealerships = []) {
    if (map) {
        map.remove(); // más seguro que map = null
    }

    map = L.map('map-container', {
        crs: CUSTOM_CRS,
        minZoom: 1.5,
        maxZoom: 5,
        boxZoom: false,
        maxNativeZoom: 5,
        preferCanvas: true,
        layers: [mapDealerships],
        center: [0, 300],
        zoom: 1.5,
        zoomControl: false,
        maxBoundsViscosity: 1.0,
        tms: false,
        noWrap: true
    });

    setTimeout(() => {
        if (map) {
            map.invalidateSize();
            var southWest = map.unproject([0, 8592], map.getMaxZoom());
            var northEast = map.unproject([8192, 0], map.getMaxZoom());
            var bounds = L.latLngBounds(southWest, northEast);
            map.setMaxBounds(bounds);
        }
    }, 500);
        let storeIcon = L.divIcon({
            iconSize: [20, 20],
			iconAnchor: [10, 10],
			popupAnchor: [5, -5],
            className: 'store-marker',

            html: `<div class="marker-icon"></div>`,
        });

    dealerships.forEach(dealership => {
        if (dealership.coords) {
            const { x, y } = dealership.coords;
            const latLng = L.latLng(y, x);
            const marker = L.marker(latLng, {icon: storeIcon})
            marker.addTo(map)
            marker.bindPopup(`<b>${dealership.name}</b>`);
            marker.on('mouseover', function(e) {
                this.openPopup();
            })

            marker.on('mouseout', function(e) {
                this.closePopup();
            })
        }
    });
}