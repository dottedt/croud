# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(document).scrollTop() > $(document).height() - $(window).height() - 75
        $('.pagination').text("Fetching more people...")
        $.getScript(url)
    $(window).scroll()