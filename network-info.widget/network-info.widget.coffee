#--------------------------------------------------------------------------------------
# Please Read
#--------------------------------------------------------------------------------------
# The images used in this widget are from the Noun Project (http://thenounproject.com).
#
# They were created by the following individuals:
#   Ethernet by Michael Anthony from The Noun Project
#   Wireless by Piotrek Chuchla from The Noun Project
#
#--------------------------------------------------------------------------------------

# Execute the shell command.
command: "network-info.widget/network_info.sh"

# Set the refresh frequency (milliseconds).
refreshFrequency: 5000

# Render the output.
render: (output) -> """
  <div id='services'>
    <div id='ethernet' class='service'>
      <p class='primaryInfo'></p>
      <p class='secondaryInfo'></p>
    </div>
    <div id='wi-fi' class='service'>
      <p class='primaryInfo'></p>
      <p class='secondaryInfo'></p>
    </div>
  </div>
"""

# Update the rendered output.
update: (output, domEl) ->
  dom = $(domEl)

  # Parse the JSON created by the shell script.
  data = JSON.parse output
  html = ""

  # Loop through the services in the JSON.
  for svc in data.service

    disabled = svc.ipaddress == ""
    el = $('#'+svc.name)
    el.find('.primaryInfo').text(svc.ipaddress || 'Not connected')
    el.find('.secondaryInfo').text(if !disabled then svc.macaddress else '')
    el.toggleClass('disabled', disabled)


# CSS Style
style: """
  margin:0
  padding:0px
  right:48px
  bottom: 22px

  #wi-fi
    background: url(/network-info.widget/images/wi-fi_light.png)

    &.disabled
      background: url(/network-info.widget/images/wi-fi_disabled.png)
      display: none

  #ethernet
    background: url(/network-info.widget/images/ethernet.png)

    &.disabled
      background: url(/network-info.widget/images/ethernet_disabled.png)
      display: none

  #wi-fi, #ethernet, #wi-fi.disabled, #ethernet.disabled
    height: 40px
    width: 100px
    background-position: left 1px
    background-repeat: no-repeat
    background-size: 32px 32px

  .service
    padding: 2px 2px 2px 42px

  .primaryInfo, .secondaryInfo
    font-family: Helvetica Neue
    padding:0px
    margin:2px

  .primaryInfo
    font-size: 8pt
    font-weight: bold
    color: rgba(#fff, 0.5)

  .secondaryInfo
    font-size: 8pt
    color: rgba(#fff, 0.35)

  .disabled p
    color: rgba(#000, 0.35)
"""