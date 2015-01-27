jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Fetching more contacts...")
        $.getScript(url)
    $(window).scroll()

jQuery ->
  $('#contact_tag_list_tokens').tokenInput '/contacts/tags.json',
    theme: 'mac'
    minChars: 2
    allowCustomEntry: true
    preventDuplicates: true
    prePopulate: $('#contact_tag_list_tokens').data('load')
