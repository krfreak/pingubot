module Bot
  module Fish
    module Voice
      extend Discordrb::Commands::CommandContainer
      puts 'Voice loaded'
      command(:vconnect, help_available: false) do |event|
        break unless event.user.id == CFG['owner_id']
        # The `voice_channel` method returns the voice channel the user is currently in, or `nil` if the user is not in a
        # voice channel.
        channel = event.user.voice_channel

        # Here we return from the command unless the channel is not nil (i. e. the user is in a voice channel). The `next`
        # construct can be used to exit a command prematurely, and even send a message while we're at it.
        next "You're not in any voice channel!" unless channel

        # The `voice_connect` method does everything necessary for the bot to connect to a voice channel. Afterwards the bot
        # will be connected and ready to play stuff back.
        BOT.voice_connect(channel)
        nil
      end

      command(:vcdc, help_available: false) do |event|
        break unless event.user.id == CFG['owner_id']
        voice_bot = event.voice
        BOT.voice_destroy(event.server.id, false)
        nil
      end

      command(:vcwol, help_available: false) do |event|
        break unless event.user.id == CFG['owner_id']
        voice_bot = event.voice

        # Since the DCA format is non-standard (i.e. ffmpeg doesn't support it), a separate method other than `play_file` has
        # to be used to play DCA files back. `play_dca` fulfills that role.
        voice_bot.play_dca('wol.dca')
        nil
      end
    end
  end
end
