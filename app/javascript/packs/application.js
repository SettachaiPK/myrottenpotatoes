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
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
$(document).ready(function()
{
    $('#G_filter').change(function()
    {
        if(this.checked == true){
         $('tr.G').show();
    } else {
            $('tr.G').hide();
        };
    });
    $('#PG_filter').change(function()
    {
      if(this.checked == true){
        $('tr.PG').show();
      } else {
        $('tr.PG').hide();
      };
    });
  
    $('#PG-13_filter').change(function()
    {
      if(this.checked == true){
        $('tr.PG-13').show();
      } else {
        $('tr.PG-13').hide();
      };
    });
  
    $('#R_filter').change(function()
    {
      if(this.checked == true){
        $('tr.R').show();
      } else {
        $('tr.R').hide();
      };
    });
  
    $('#NC-17_filter').change(function()
    {
      if(this.checked == true){
        $('tr.NC-17').show();
      } else {
        $('tr.NC-17').hide();
      };
    });
  
  });