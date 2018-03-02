options =
  player: 'itunes' # spotify | itunes

commands =
  itunes: "osascript -e 'if application \"iTunes\" is running then tell application \"iTunes\" to if player state is playing then artist of current track & \" - \" & name of current track'"
  spotify: "osascript -e 'if application \"Spotify\" is running then tell application \"Spotify\" to artist of current track & \" - \" & name of current track'"

command: "echo " +
         "$(#{ commands.itunes}):::" +
         "$(#{ commands.spotify})"

refreshFrequency: '10s'

render: ( ) ->
  """
    <div class="container">
        <div class="widg" id="music">
          <i class="fab fa-itunes-note"></i>
          <span class="playing-output"></span>
        </div>
    </div>
  """

update: ( output, domEl ) ->
  output = output.split( /:::/g )

  if options.player == 'itunes'
    $( ".playing-output") .text("#{ output[ 0 ] }")
  else if options.player == 'spotify'
    $( ".playing-output") .text("#{ output[ 1 ] }")
  else
    $( ".playing-output") .text("No player set.")
