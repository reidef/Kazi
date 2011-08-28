jQuery ->
  $('#user_control button').button
    icons: 
      secondary: "ui-icon-triangle-1-s"
  .click ->
    $('#user_control ul.popup_menu').toggle()
  return