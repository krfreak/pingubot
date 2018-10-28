module Bot
  module Fish
    module Noots
      extend Discordrb::Commands::CommandContainer
      puts 'Noots loaded'

      command :highnoot do
        "It's high noot! https://pbs.twimg.com/profile_images/736904129222705152/_1_3XzoR.jpg"
      end

      command :gnoot do |event|
          if event.message.mentions.blank?
            "Good Noot!\nhttp://i.imgur.com/Wk8l7gk.gif"
          else
            "<@#{event.message.mentions.first.id}> Good Noot!\nhttp://i.imgur.com/Wk8l7gk.gif"
          end
      end

      command :noot do
        'Noot noot!'
      end

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

      command :atomicnoot do
        "NOOT NOOT! https://i.imgur.com/ccOjDea.gif"
      end

      command :pingudancing do
        "https://uploads.disquscdn.com/images/41dd8205db5128f0132306e0b054b16d443058e3bc8545c3c362131a5175ba70.gif"
      end

      command :letitnoot do
        "https://www.youtube.com/watch?v=x9ur3exaUTI"
      end

      command :bla do
        "http://i.giphy.com/r5VyR8qxoFRn2.gif"
      end

      command :clap do
        "http://i.giphy.com/109Yj8ozm6szJe.gif"
      end

      command :blarg do
        "http://i.giphy.com/cAoMsVBVzpSJW.gif"
      end
      
      command :butt do
        "http://i.giphy.com/iDPv54rvXkkA8.gif"
      end
      
      command :policenoot do
        "Noot noot, that's the sound of the police! <https://www.youtube.com/watch?v=8KiPNxEArAg>"
      end
      
      command :nootstorm do
        "NOOT NOOT NOOT <https://www.youtube.com/watch?v=H0IlJc_vkZ0> NOOT NOOT NOOT"
      end
    end
  end
end
