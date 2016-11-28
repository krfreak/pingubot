module Bot
  module Fish
    module ArtStuff
      extend Discordrb::Commands::CommandContainer
      puts 'Art loaded'

      command :art, description: "Get a randomly chosen artwork that contains <tag1>\n Usage: !!art <tag1> <-tag2>\n- excludes that tag from the request" do |event, *args|
        result = get_art parse_input args
        if !result.nil?
          random_text result
        else
          'Sorry, got nothing on that.'
        end
      end

      command :ca, description: "Get a random art with Chloe" do
        random_text get_art parse_input ["chloe"]
      end

      command :pfa, description: "Get a random art with Pricefield" do
        random_text get_art parse_input ["pricefield"]
      end

      command :ka, description: "Get a random art with Kate" do
        random_text get_art parse_input ["kate"]
      end

      command :cua, description: "Get a random cute art" do
        random_text get_art parse_input ["cute"]
      end

      command :ra, description: "Get a random art with Rachel" do
        random_text get_art parse_input ["rachel"]
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
  field :last_use,  type: DateTime
end

def get_art(tags)
  art = tags[:inc].blank? ? Art.where(tags: { '$nin' => tags[:exc]}) : Art.where(tags: { '$all' => tags[:inc] }).and(tags: { '$nin' => tags[:exc] })
  count = art.count
  art = art.order_by(last_use: :desc).last
  if art.present?
    art.update(:last_use => DateTime.now)
    {:art => art, :args => tags[:raw_input], :count => count}
  else
    nil
  end
end

def parse_input(input)
  inc = []
  exc = []
  unless input.blank?
    inc = Marshal.load(Marshal.dump(input))
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
  unless input.include? '+nsfw'
    exc.push 'nsfw' unless input.include? 'nsfw'
  end
  {:inc => inc, :exc => exc, :raw_input => input}
end

def random_text(art)
  p art
  "Random #{art[:args]} art (#{art[:count]} results): " << (art[:art].tags.include?("nsfw") ? "[NSFW] <#{art[:art].link}>" : "#{art[:art].link}")
end
