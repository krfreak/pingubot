module Bot
  module Fish
    module ArtStuff
      extend Discordrb::Commands::CommandContainer
      puts 'Art loaded'

      command :art, description: "Get a randomly chosen artwork that contains <tag1>\n Usage: !!art <tag1> <-tag2>\n- excludes that tag from the request" do |event, *args|
        inc = []
        exc = []
        unless args.blank?
          inc = Marshal.load(Marshal.dump(args))
          inc.each(&:downcase!)
          inc.each do |a|
            exc.push a if a.chars.first == '-'
          end
          inc.delete_if do |a|
            a.start_with? '-'
          end
          inc.delete_if do |a|
            a.start_with? '+'
          end
          exc.each do |a|
            a.slice!(0)
          end
        end
        unless args.include? '+nsfw'
          exc.push 'nsfw' unless args.include? 'nsfw'
        end
        result = get_art(inc, exc, ((args.include? 'nsfw') || (args.include? '+nsfw')))
        if !result.nil?
          if (args.include? 'nsfw') || (args.include? '+nsfw')
            "Random #{args.to_s.downcase} art (#{result[1]} results): <#{result[0]}>"
          else
            "Random #{args.to_s.downcase} art (#{result[1]} results): #{result[0]}"
          end
        else
          'Sorry, got nothing on that.'
        end
      end

      command :ca, description: "Get a random art with Chloe" do
        random_text "Chloe"
      end

      command :pfa, description: "Get a random art with Pricefield" do
        random_text "Pricefield"
      end

      command :ka, description: "Get a random art with Kate" do
        random_text "Kate"
      end

      command :cua, description: "Get a random cute art" do
        random_text "cute"
      end

      command :ra, description: "Get a random art with Rachel" do
        random_text "rachel"
      end

    end
  end
end

class Art
  include Mongoid::Document

  field :link,      type: String
  field :tags,      type: Array
  field :preview,   type: String
  field :source,    type: String
  field :last_use,  type: Date
end

def get_art(inc, exc, nsfw = false)
  exc << "nsfw" unless nsfw
  art = inc.blank? ? Art.where(tags: { '$nin' => exc}) : Art.where(tags: { '$all' => inc }).and(tags: { '$nin' => exc })
  count = art.count
  art = art.order_by(last_use: :desc).last
  if art.present?
    art.touch :last_use
    [art[:link], count]
  else
    nil
  end
end

def random_text(text)
  "Random #{text} art: " << get_art([text.downcase], [])[0]
end
