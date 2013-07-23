// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

jQuery(document).ready(function() {
  setTimeout(function() {
    var source = new EventSource('/stream');
    source.addEventListener('message', function(e) {
      // window.location.reload();
      json = JSON.parse(JSON.parse(e.data));
      domNode = $('#status-' + json.component_id);
      domNode.html(json.to);
      switch (json.to)
      {
      case 'up':
        color = '#5bb75b';
        break;
      case 'down':
        color = '#da4f49';
        break;
      case 'faulty':
        color = '#faa732';
        break;
      }
      domNode.animate({
            backgroundColor: color
        }, 300 );
      domNode.animate({
            backgroundColor: "white"
        }, 1500 );
    });
  }, 1);
});
