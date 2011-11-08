// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
  
  $("input, checkbox, radio, file, textarea, select, button").uniform();
  $("#event_date").datepicker();
  $("#event_time").timePicker({
            startTime: "08:00",
            show24Hours: false,
            separator: ':',
            step: 15});
            
              
}); 

