// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require jquery.tokeninput
//= require_tree .
jQuery(function() {
  if ($('.pagination').length) {
    $(window).scroll(function() {
      var url;
      url = $('.pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.pagination').text("Fetching more contacts...");
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }
});

jQuery(function() {
  return $('#contact_tag_list_tokens').tokenInput('/contacts/tags.json', {
    theme: 'mac',
    minChars: 2,
    allowCustomEntry: true,
    preventDuplicates: true,
    prePopulate: $('#contact_tag_list_tokens').data('load')
  });
});

