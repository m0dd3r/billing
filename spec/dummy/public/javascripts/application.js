// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
  $('.add-plan-limit').live('click', function(e) {
    e.preventDefault();
    $('#plan-limit-list').append(newLimitField("billing_plan"));
    // $('#plan-limit-list li:first').clone().find('input').val('')
    // .end().appendTo('#plan-limit-list');
  });

  $('.delete-plan-limit').live('click', function() {
    if ($('#plan-limit-list li').length > 1) {
      $(this).prev("input[type=hidden]").val("1");
      $(this).parent().hide();
    } else
      alert('Plans must have at least one limit.')
  });
});
