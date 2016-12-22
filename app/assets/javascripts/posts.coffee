ready = ->

  $( "#select-dropdown" ).select2
    theme: "bootstrap"

$(document).ready(ready)
$(document).on('page:load', ready)
