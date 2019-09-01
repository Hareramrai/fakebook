// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require lodash
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){

  var handleTextArea = function(element, height) {
    $(element).css({'height': height,'overflow-y':'hidden'}).height(element.scrollHeight-30);
  };

  var highlight = function(){
    $("#status-overlay").show();
    $("#new_status").css('z-index','9999999');
    $("#new_status").css('position', 'relative');
  };

  var previewImages = function() {
    var files = this.files;

    $('#image_preview').html('')

    _.forEach(files, function(file) {
      $('#image_preview').append("<div class='col-md-3'><img class='img-responsive' src='" + URL.createObjectURL(file) + "'></div>");
    });
  }

  $('textarea').on('focus', function () {
    handleTextArea(this, '165px');
  }).on('blur', function() { 
    handleTextArea(this, '100px');
  })

  $('textarea').on('click', function(e) {
    highlight();
    e.stopPropagation();  
  });

  $(document).on('click', function (e) {
    $("#status-overlay").hide();
    $("#new_status").css('z-index','1');
    $("#new_status").css('position', '');
  });

  $("#post_images").change(previewImages)

})
