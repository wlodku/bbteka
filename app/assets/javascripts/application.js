
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require react
//= require react_ujs
//= require components
//= require filterrific/filterrific-jquery
//= require_tree .

$(document).ready(function(){
   $('.dropdown-toggle').dropdown();

});

//New edit user form begin

$(document).on("click", ".generate-pass", function(e){
  e.preventDefault();
  $('.pass').attr('type', 'text');
  var randomstring = Math.random().toString(36).slice(-8);
  $('.pass').val(randomstring);
  $('.show-pass').html('Ukryj');
});

$(document).on("click", ".reset-pass", function(e){
  e.preventDefault();
  $('.pass').attr("disabled", false);
  var randomstring = Math.random().toString(36).slice(-8);
  $('.pass').val(randomstring);
  $('.confirm-pass').val($('.pass').val());

});

$(document).on("keyup", ".new-pass", function(){
  console.log('dziaua');
  $('.confirm-pass').val($('.new-pass').val());

});

$(document).on("click", ".show-pass", function(e){
  e.preventDefault();
  if( $(this).html()=='Pokaż') {
    $(this).html('Ukryj');
    $('.pass').attr('type', 'text');
  }
  else {
    $(this).html('Pokaż');
    $('.pass').attr('type', 'password');
  }
});

//New edit user form end

//Import users begin
$(document).on("click", ".select-all", function(){
  var checkBoxes = $(".select-user");
  checkBoxes.prop("checked", !checkBoxes.prop("checked"));
});
//Import users end
