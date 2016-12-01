module Bot
  module Fish
    module Noots
      extend Discordrb::Commands::CommandContainer
      puts 'Noots loaded'

      command :highnoot do
        "It's high noot! https://pbs.twimg.com/profile_images/736904129222705152/_1_3XzoR.jpg"
      end

      command(:noot) { 'Noot noot!' }

      command :noots do |event|
        break if event.message.mentions.blank?
        if event.message.mentions.first.id == CFG['owner_id']
          "*hugs his master* Noot!"
        elsif event.message.mentions.first.id == 126011969097564160
          "Hey pal! ***high fives <@126011969097564160>***  Noot!"
        else
          "***" << ["sneaks up behind","materializes above","waves at","throws fish at","waddles around","tackles","flaps wildly at","teleports underneath","steps out of a dimensional portal in front of"].sample << " <@#{event.message.mentions.first.id}>***  NOOT NOOT!"
        end
      end
    end
  end
end
