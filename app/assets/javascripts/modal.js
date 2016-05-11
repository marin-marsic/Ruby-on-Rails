/**
 * Created by Mislav on 12/15/2015.
 */

$(document).ajaxError(function(event, request) {
    var msg = request.getResponseHeader('X-Message');
    if (msg) alert(msg);
});