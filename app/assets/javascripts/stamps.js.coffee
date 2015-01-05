# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
    $('#search-by-brand').keyup ->
        $.getJSON('.', {brand: this.value})
            .done (data) ->
                $('#stamps tbody').empty()
                $('#nothing-found').hide()

                if data.length == 0
                    $('#nothing-found').show()
                else
                    for stamp in data
                        $('#stamps tbody')
                            .append("<tr><td>#{stamp['brand']}</td><td>#{stamp['magazine']}</td><td class=\"right-align\">#{stamp['page']}</td></tr>")
