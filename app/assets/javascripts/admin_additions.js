$(function() {
    $("#features_block").delegate(".dictionary", "change", function(event) {
        var selected_dictionary_id = this.selectedOptions[0].value;
        var selected_dictionary = null;

        dictionary.forEach(function(dict) {
            if (dict.id == selected_dictionary_id) {
                selected_dictionary = dict;
            }
        });

        $("#" + this.id + "_item")[0].options.length = 0;
        if (selected_dictionary != null) {
            var items_selector = $("#" + this.id + "_item")[0];
            selected_dictionary.dictionary_items.forEach(function(item) {
                items_selector.options[items_selector.options.length] = new Option(item.name, item.id);
            });
        }
    });

    $("#features_block").delegate(".add_new_feature", "click", function(event) {
       event.preventDefault();
       var next_id = $(".features").length + 1;
       var feature = $(".features").first().clone(true);
       var dictionary = feature.find(".dictionary");
       dictionary.attr("id", "dictionary" + next_id);
       dictionary[0].options[0].selected = true;
       var dictionary_item = feature.find(".dictionary_item");
       dictionary_item.attr("id", "dictionary" + next_id + "_item");
       dictionary_item.attr("name", "collection_items["+next_id+"]");
       dictionary_item[0].options.length = 0;
       feature.appendTo("#features_block");
    });
});

$(document).ready(function() {
    var prevLat = parseFloat($("#lot_gps_lat").attr('value'));
    prevLat = prevLat || 35.032245;
    var prevLon = parseFloat($("#lot_gps_lon").attr('value'));
    prevLon = prevLon || 33.137512;

    var cyprLatlng = new google.maps.LatLng(prevLat,prevLon);

    var mapOptions = {
        zoom: 8,
        center: cyprLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById('map_canvas'),
        mapOptions);
    var marker = new google.maps.Marker({
        position: cyprLatlng,
        map: map,
        title: 'Location!',
        draggable:true
    });

    google.maps.event.addListener(marker, 'dragend', function() {
        var newPosition = marker.getPosition();
        $("#lot_gps_lat").attr('value',newPosition.lat());
        $("#lot_gps_lon").attr('value',newPosition.lng());
    });
});