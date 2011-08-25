# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('input[name*="date"]').datepicker
    dateFormat: 'yy-mm-dd'
  
  $('body.projects #sort').click ->
    $(@).hide()
    $('#save').show()
    $('.tasks').nestedSortable
      forcePlaceholderSize: true,
      handle: 'div',
      helper: 'clone',
      listType: 'ul',
      items: 'li',
      opacity: .6,
      placeholder: 'placeholder',
      revert: 250,
      tabSize: 25,
      tolerance: 'pointer',
      toleranceElement: '> div'
    return
  
  $('body.projects #save').click ->
    $.ajax
      type: 'put'
      data: $('.tasks').nestedSortable 'serialize'
      dataType: 'script'
      url: '/tasks/nest'
    $(@).hide()
    $('#sort').show()
    $('.tasks').nestedSortable "destroy"
    return
  return