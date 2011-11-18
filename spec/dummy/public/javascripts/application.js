// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
  $('a#add-plan-limit').click(function() {
    $('#plan-limit-list li:first').clone().find('input').val('')
    .end().appendTo('#plan-limit-list');
  });

 $('.delete-plan-limit').live('click', function() {
  if ($('#plan-limit-list li').length > 1)
   $(this).parent().remove();
 else
  alert('Plans must have at least one limit.')
 });
});
