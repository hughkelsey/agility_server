ready = ->
  console.log('ready')
  $(document).on 'click', 'li.stream',(event) ->
    streamid = $(@).data('streamid')
    document.location.href= "#{document.location.href}/stream?stream_id=#{streamid}"

$(document).ready(ready)
$(document).on('page:load', ready)
