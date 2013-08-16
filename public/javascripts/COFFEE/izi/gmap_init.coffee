@initGMap = ->
  GMap.find = new google.maps.Geocoder()

  mapOptions =
    zoom:      16
    center:    new google.maps.LatLng(59.939, 30.312)
    mapTypeId: google.maps.MapTypeId.ROADMAP

  GMap.map  = new google.maps.Map document.getElementById("map-canvas"), mapOptions

  GMap.on GMap.map, 'click', (e) ->
    GMap.clean()
    GMap.build_marker_group(e.latLng)
    GMap.geocode_for_position(e.latLng)