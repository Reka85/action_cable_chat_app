App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert("You have a new mention") if data.mention
    if (data.message && !data.message.blank?)
      $('#messages-table').append data.message
      scroll_bottom()

# we call these methods after page has been loaded
$(document).on 'turbolinks:load', ->
  submit_message()
  scroll_bottom()

#if enter key is pressed in the message box we imitate a click on the submit button, clear the box, and ignore the 'enter' character
#in main.sass we hide send button, but without the message_form f.submit it would not work

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13 && !event.shiftKey # shift + enter won't submit the text, it will add a new line
      $('input').click()
      event.target.value = ""
      event.preventDefault()

# scrolls down to the last message
scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)
