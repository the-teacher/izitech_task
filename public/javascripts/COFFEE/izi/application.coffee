$ ->
  do initGMap

  $('a.bound').on 'click', ->
    return false unless GMap.bound
    GMap.bound.setVisible !GMap.bound.getVisible()
    false

  $('.search_form').on 'click', '#find_it', ->
    input = $ '#address'

    GMap.find.geocode
      address: input.val()
    , (results, status) ->
      if status is google.maps.GeocoderStatus.OK
        first_place = results[0]

        if first_place
          position = first_place.geometry.location

          GMap.clean()
          GMap.map.setCenter position
          GMap.build_marker_group(position)
          GMap.geocode_for_position(position)
      else
        log "Geocode was not successful for the following reason: #{status}"