module Bot
  module Fish
    module Shenanigans
      extend Discordrb::Commands::CommandContainer
      puts 'Shenanigans loaded'

      command :bay do |event|
        "#ThereIsNoBayEnding"
      end

      command :koethe do |event|
        "Random Koethe song " << ["https://www.youtube.com/watch?v=rhvZxmgLfNA","https://www.youtube.com/watch?v=IcJP7V_3Fdc","https://www.youtube.com/watch?v=KRpy1JKZ4wY","https://www.youtube.com/watch?v=DE0IVM7T3ic","https://www.youtube.com/watch?v=rW4eVMb_Sls","https://www.youtube.com/watch?v=z1NOTgl-4yI","https://www.youtube.com/watch?v=R4uo83J5CTA","https://www.youtube.com/watch?v=2KdN6_1bK1M","https://www.youtube.com/watch?v=2MPB7cu9W_c","https://www.youtube.com/watch?v=apr60Dh0BXE","https://www.youtube.com/watch?v=rTrlQogUwtg","https://www.youtube.com/watch?v=ynLDKMAcDPo","https://www.youtube.com/watch?v=b4EEi4R8yHY","https://www.youtube.com/watch?v=3HZY1uA_hes","https://www.youtube.com/watch?v=5mYBnowe4OY","https://www.youtube.com/watch?v=Z5SvnsLMH2o","https://www.youtube.com/watch?v=mqv1NEWG0G4","https://www.youtube.com/watch?v=mzdSepr9xKA"].sample
      end

      command :pricefield do |event|
        "The One True Pairing! #bae>bay"
      end

      command :antisin do |event|
        unless event.message.mentions.blank?
          "Chloe has a message for you, <@#{event.message.mentions.first.id}>: http://i.imgur.com/ABlyXTG.jpg"
        else
          "Chloe has a message for you: http://i.imgur.com/ABlyXTG.jpg"
        end
      end

      command :sin do |event|
        unless event.message.mentions.blank?
          "Kate has a message for you, <@#{event.message.mentions.first.id}>: http://i.imgur.com/M6tLQ3Q.jpg"
        else
          "Kate has a message for you: http://i.imgur.com/M6tLQ3Q.jpg"
        end
      end

      command :friends do |event|
        "We're all friends here and while we may not agree with your opinions on everything we want you to know you are welcome to hang out and talk."
      end

      command :nohate do |event|
        "We might not agree with you, but we don't hate you personally."
      end

      command :grahamfield do |event|
        "Twilight, still a better love story than grahamfield."
      end

      command :reminder do |event|
        "Please keep your discussion civil! Remember: we all may have different opinions on the discussion but that does not mean that you should start to disrespect other opinions than your own."
      end

      command :welcome do |event|
        unless event.message.mentions.blank?
          "Hella welcome to <@#{event.message.mentions.first.id}>! Your personal welcome gift: https://i.imgur.com/iGK9uxn.png"
        else
          "Hella welcome! Your personal welcome gift: https://i.imgur.com/iGK9uxn.png"
        end
      end

      command :welcome2 do |event|
        unless event.message.mentions.blank?
          "Hella welcome to <@#{event.message.mentions.first.id}>! Your personal welcome gift: http://40.media.tumblr.com/ff07d79fecdd13b407e1dd1f5186476a/tumblr_o1sc8cP3wU1sj5rhfo1_r1_1280.jpg"
        else
          "Hella welcome! Your personal welcome gift: http://40.media.tumblr.com/ff07d79fecdd13b407e1dd1f5186476a/tumblr_o1sc8cP3wU1sj5rhfo1_r1_1280.jpg"
        end
      end

      command :baecome do |event|
        unless event.message.mentions.blank?
          "Hella welcome to <@#{event.message.mentions.first.id}>! Your personal baecome gift: http://i.imgur.com/PqnIQgt.png"
        else
          "Hella welcome! Your personal baecome gift: http://i.imgur.com/PqnIQgt.png"
        end
      end

      command :baycome do |event|
        unless event.message.mentions.blank?
          "Hella welcome to <@#{event.message.mentions.first.id}>! Your personal baycome gift: http://dandelion-s.deviantart.com/art/Life-is-Strange-568865002"
        else
          "Hella welcome! Your personal baycome gift: http://dandelion-s.deviantart.com/art/Life-is-Strange-568865002"
        end
      end

      command :soap,  description: "Hands you a or someone you mention a handy piece of pricefield soap" do |event|
        unless event.message.mentions.blank?
          "*hands <@#{event.message.mentions.first.id}> a piece of pricefield soap*"
        else
          "*hands <@#{event.user.id}> a piece of pricefield soap*"
        end
      end

      command :endings do |event|
        "When we talk about bae/bay we mean the choice at the end of the game. Bae means keeping Chloe, bay means sacrificing Chloe."
      end

      command :bae do |event|
        "Bae>Bay. Preach it."
      end

      command :BAE, help_available: false do |event|
        "```\n"+" ______         _______             ______       _     _\n"+"(____  \\   /\\  (_______)   _  _    (____  \\   /\\| |   | |\n"+" ____)  ) /  \\  _____     ( \\( \\    ____)  ) /  \\ |___| |\n"+"|  __  ( / /\\ \\|  ___)     ) )) )  |  __  ( / /\\ \\_____/\n"+"| |__)  ) |__| | |_____   (_/(_/   | |__)  ) |__| |___\n"+"|______/|______|_______)           |______/|______(___)\n"+"                                                         ```"
      end

      command :puhi,  help_available: false do |event|
        "Puhi puhi!" if event.user.id == CFG['owner_id'] || event.user.id == 167343260614787073
      end

      command :cookie do |event|
        unless event.message.mentions.blank?
          "*gives <@#{event.message.mentions.first.id}> a pricefield cookie* :cookie:"
        else
          "*gives <@#{event.user.id}> a pricefield cookie* :cookie:"
        end
      end

      command :penguinfact do |event|
        ["Penguins can spend up to 75% of their lives in the water. They do all of their hunting in the water.","Penguins can be found on every continent in the Southern Hemisphere from the tropical Galapagos Islands (the Galapagos penguin) located near South America to Antarctica (the emperor penguin).","The penguin species with the highest population is the Macaroni penguin with 11,654,000 pairs.","The species with the lowest population is the endangered Galapagos penguin with between 6,000-15,000 individuals.","In general, penguins closer to the equator eat more fish and penguins closer to Antarctica eat more squid and krill.","King and emperor penguins lay one egg. All other species of penguin lay two eggs.","Emperor Penguins are the tallest species, standing nearly 4 feet tall. The smallest is the Little Blue Penguin, which is only about 16 inches.","The fastest species is the Gentoo Penguin, which can reach swimming speeds up to 22 mph.","Penguins' striking coloring is a matter of camouflage; from above, their black backs blend into the murky depths of the ocean. From below, their white bellies are hidden against the bright surface.","Fossils place the earliest penguin relative at some 60 million years ago, meaning an ancestor of the birds we see today survived the mass extinction of the dinosaurs.","All but two species of penguins breed in large colonies of up to a thousand birds.","It varies by species, but many penguins will mate with the same member of the opposite sex season after season.","Some species create nests for their eggs out of pebbles and loose feathers. Emperor Penguins are an exception: They incubate a single egg each breeding season on the top of their feet. Under a loose fold of skin is a featherless area with a concentration of blood vessels that keeps the egg warm.","In some species, it is the male penguin which incubates the eggs while females leave to hunt for weeks at a time. Because of this, pudgy males—with enough fat storage to survive weeks without eating—are most desirable.","Penguin parents—both male and female—care for their young for several months until the chicks are strong enough to hunt for food on their own.","If a female Emperor Penguin's baby dies, she will often \"kidnap\" an unrelated chick—but rather than raise it as her own, she soon abandons the stolen chick.","Despite their lack of visible ears, penguins have excellent hearing and rely on distinct calls to identify their mates when returning to the crowded breeding grounds.","The first published account of penguins comes from Antonio Pigafetta, who was aboard for Ferdinand Magellan's first circumnavigation of the earth in 1520 when the animals were caught near what was probably Punta Tombo in Argentina.","Penguins evolved to stay in the Southern Hemisphere because there are no land predators, like wolves or polar bears, to take make quick work of the plump flightless prey.","Because they aren't used to danger from animals on solid ground, wild penguins exhibit no particular fear of human tourists.","Unlike most sea mammals—which rely on blubber to stay warm—penguins survive because their feathers trap a layer of warm air next to the skin that serves as insulation, especially when they start generating muscular heat by swimming around.","Penguins often slide on their tummies over ice and snow. This is called tobogganing. Researchers believe they do this for fun and as an efficient way to travel.","Penguins molt, or lose their feathers, once a year. They always molt on land or ice and until they grow new waterproof coats, they are unable to go into the water. Molting may take weeks, and most penguins lose about half their body weight during this time.","Penguins are highly social birds. Even at sea, penguins usually swim and feed in groups. Some penguin colonies on Antarctica are huge and can contain 20 million or more penguins at various times during the year.","Out of all the penguin and bird species, the Emperor Penguin (Aptenodytes forsteri) breeds in the coldest environment. Air temperatures may reach -40° F (-40° C) and wind speeds may reach 89 mph (144 km/hr).","A penguin’s normal body temperature is approximately 100° F (38° C).","Emperor Penguins are the fifth heaviest of all bird species, although an adult male will lose about 26 pounds while he waits for a penguin chick to hatch.","Emperor Penguins have the widest variety of vocalizations of all penguins. Scientists believe this is because they have no fixed nest site and must rely on vocal calls alone to find their chicks and mate.","Most penguin species breed during the spring and summer. Egg incubation varies from 1 month and 67 days, depending on the species. The Emperor Penguin is the only penguin that breeds during the Antarctic winter.","Penguins can stay underwater for 10-15 minutes before coming to the surface to breathe. Penguins cannot breath underwater.","In 2012, scientists discovered that a primary reason penguins can swim so fast is that they have a special “bubble boost.” When penguins fluff their feathers, they release bubbles that reduce the density of the water around them. The bubbles act as lubrication that decreases water viscosity, similar to competitive swimsuits.","Penguins’ eyes work better under water than they do in air. Many scientists believe penguins are extremely short-sighted on land.","Only two species, the Adélie (Pygoscelis adeliae) and the Emperor Penguins, live on the frozen land of Antarctica. Most penguins live farther north, in New Zealand or along the coast of South America.","Different penguins species have different ways of attracting a mate. King Penguins, for example, sing long songs with their partners. Gentoo Penguin males give their mates gifts of small pebbles or stones. For penguins, bonding is an important part of raising a chick.","When penguin chicks hatch, they are not waterproof, so they must stay out of the ocean. They depend on their parents to bring them food and to keep them warm until waterproof feathers replace their fluffy down coats.","Some prehistoric penguins were very large, growing nearly as tall and heavy as a human.","Penguin etymology is debated. Several scholars claim the word is derived from the Welsh pen gwyn, or “white head.” It originally appeared in the 16th century as a synonym for Great Auk. Other researches believe it is related to the Latin pinguis, or “fat.”","Smaller penguins usually do not dive as deep as larger penguins. Larger penguins, such as Emperor Penguins, can dive as far as 1,870 feet for as long as 22 minutes, making it the deepest-diving nonflying bird and the longest submerged bird. An Emperor Penguin has solid bones rather than air-filled bones, which eliminates the risk of barotrauma. Their heart rate slows to 15-20 beats per minute and nonessential organs shut down during long dives.","Penguins can control the blood flow to their extremities in order to reduce the amount of blood that gets cold, but not enough so that their extremities freeze.","Penguins can drink salt water because they have a special gland, the supraorbital gland, that filters salt from the bloodstream.","An adult male Emperor Penguin is the longest-fasting bird. It will not eat for approximately 115 days during its chick’s incubation/hatching period.","A group of young penguin chicks is called a “crèche.” A group of penguins in the water is called a “raft.” A group of penguins on land is called a “waddle.”","Penguins have more feathers than most other birds, averaging approximately 70 feathers per square inch. The Emperor Penguin has the most of any bird, at around 100 feathers per one square inch.","While Chinstrap Penguins look dignified and gentleman-like, their exceptionally loud cries have earned them the nickname “Stonecracker” penguins.","A wild penguin typically lives between 15-20 years, spending approximately 75% of their lives in the water.","While some penguins mate for life or until a partner dies, some penguins often mate with new partners while the old ones are still alive and in the same colony. Some researchers have noted that male and female penguins sometimes “cheat” on their partners, even while they are nesting and raising young with another penguin.","Penguins usually enter and leave the sea in large groups. Scientists believe this is for “safety in numbers.” By blending into a crowd, an individual penguin may avoid catching the attention of a predator.","Penguins swim so fast that they can propel themselves over 7 feet (2 meters) above water. The technique they use to cue through waves like dolphins or porpoises is called “porpoising.”"].sample
      end

      command :plisd do |event|
        "PLiSD - **P**ost **L**ife **i**s **S**trange **D**epression"
      end

      command :choose,  help_available: false do |event|
        "W/e. Bae. #bae>bay"
      end

      command :marshfield,  help_available: false do |event|
        "Try !!pricefield instead."
      end

      command :mfa,  help_available: false do |event|
        "Try !!pfa instead."
      end

      command :well do |event|
        unless event.message.mentions.blank?
          "Chloe has a question for you, <@#{event.message.mentions.first.id}>: http://i.imgur.com/OhoHDgu.jpg"
        else
          "Chloe has a question for you: http://i.imgur.com/OhoHDgu.jpg"
        end
      end

      command :consequences do |event|
        "Ƹ̵̡Ӝ̵̨̄Ʒ this action will have consequences"
      end
    end
  end
end
