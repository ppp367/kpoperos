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
//= require bxslider
//= require_tree .


$(document).ready(function(){
  $('.bxslider').bxSlider();

  $('#btn-mie').click(function(){
  		$('#miercoles').css({"display":"table-row-group"});
  		$('#jueves').css({"display":"none"});
  		$('#viernes').css({"display":"none"});
  });

  $('#btn-jue').click(function(){
  		$('#jueves').css({"display":"table-row-group"});
  		$('#miercoles').css({"display":"none"});
  		$('#viernes').css({"display":"none"});
  });

  $('#btn-vie').click(function(){
  		$('#viernes').css({"display":"table-row-group"});
  		$('#jueves').css({"display":"none"});
  		$('#miercoles').css({"display":"none"});
  });

  $('#comprar-carnet').click(function(){
  		$('#comprar-menu').css({"display":"block"});
  });

  $('#comprar-menu button').click(function(){
  		$('#comprar-menu').css({"display":"none"});
  });
});