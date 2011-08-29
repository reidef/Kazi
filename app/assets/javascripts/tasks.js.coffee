# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('body.tasks #sort').click ->
    $(@).hide()
    $('#save').show()
    $('#todo').sortable
      axis:'y',
      items: 'div',
      scroll: true,
      placeholder: 'placeholder'
    return

  $('body.tasks #save').click ->
    $.ajax
      type: 'put'
      data: $('#todo').sortable 'serialize'
      dataType: 'script'
      url: '/tasks/prioritize'
    $(@).hide()
    $('#sort').show()
    $('#todo').sortable "destroy"
    return
  return