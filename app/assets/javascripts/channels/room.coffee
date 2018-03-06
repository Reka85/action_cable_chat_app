App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.content.blank?
      $('#messages-table').append '<div class="message">' +
        '<div class="message-user">' + data.username + ":" + '</div>' +
        '<div class="message-content">' + data.content + '</div>' + '</div>'

# we call the method after page has been loaded
$(document).on 'turbolinks:load', ->
  submit_message()

#if enter key is pressed in the message box we imitate a click on the submit button, clear the box, and ignore the 'enter' character
#in main.sass we hide send button, but without the message_form f.submit it would not work

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      $('input').click()
      event.target.value = ""
      event.preventDefault()

