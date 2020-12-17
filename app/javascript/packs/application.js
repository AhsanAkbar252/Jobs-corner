// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

import 'jquery'
import 'popper.js'
import "bootstrap";
import "./css/site.scss";
global.$ = jQuery;
/*! jQuery v3.3.1 | (c) JS Foundation and other contributors | jquery.org/license */
$(document).on('ready turbolinks:load', function() {
  
  
  $('body').on('click', '#candidates', function(e){
    e.preventDefault();
    $("#candidateContainer").toggleClass('open');
    $("#employerContainer").removeClass('open');
    $("#profileContainer").removeClass('open');
    $("#pageContainer").removeClass('open');v
  }); 

  
  
  $('body').on('click', '#employers', function(e){
    e.preventDefault();
    $("#employerContainer").toggleClass('open');
    $("#candidateContainer").removeClass('open');
    $("#profileContainer").removeClass('open');
    $("#pageContainer").removeClass('open');
  }); 

  
  $('body').on('click', '#profile', function(e){
    e.preventDefault();
    $("#profileContainer").toggleClass('open');
    $("#candidateContainer").removeClass('open');
    $("#employerContainer").removeClass('open');
    $("#pageContainer").removeClass('open');
  });

    $('body').on('click', '#pages', function(e){
    e.preventDefault();
    $("#pageContainer").toggleClass('open');
    $("#candidateContainer").removeClass('open');
    $("#employerContainer").removeClass('open');
    $("#profileContainer").removeClass('open');
  }); 

  $('body').on('click', function(e){
    var clickover = $(e.target);
    if (!clickover.parents().hasClass("pc") || clickover.hasClass("dez-page")) {      
        $('.navbar-collapse').removeClass('show');
    
    }
  }); 

  // $('body').on('click', '#candidates', function(e){
  //   e.preventDefault();
  //   debugger;
  //   $("#candidateContainer").toggleClass('open');
  //   $("#employerContainer").removeClass('open');
  //   $("#profileContainer").removeClass('open');
  // }); 

  
  
  // $('#employers').on('click', function(e){
  //   e.preventDefault();
  //   $("#employerContainer").toggleClass('open');
  //   $("#candidateContainer").removeClass('open');
  //   $("#profileContainer").removeClass('open');
  // }); 

  
  // $('body').on('click', '#profile', function(e){
  //   e.preventDefault();
  //   $("#profileContainer").toggleClass('open');
  //   $("#candidateContainer").removeClass('open');
  //   $("#employerContainer").removeClass('open');
  // }); 
});





