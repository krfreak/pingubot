module Bot
  module Fish
    module ArtStuff
      extend Discordrb::Commands::CommandContainer
      puts 'Art loaded'

      command :art, description: "Get a randomly chosen artwork that contains <tag1>\n Usage: !!art <tag1> <-tag2>\n- excludes that tag from the request" do |event, *args|
        output args, event
      end

      command :ca, description: "Get a random art with Chloe" do |event|
        output "chloe", event
      end

      command :pfa, description: "Get a random art with Pricefield" do |event|
        output "pricefield", event
      end

      command :arrt, description: "Get a random art with pirates" do |event|
        output "pirates", event
      end

      command :ka, description: "Get a random art with Kate" do |event|
        output "kate", event
      end

      command :cua, description: "Get a random cute art" do |event|
        output "cute", event
      end

      command :ra, description: "Get a random art with Rachel" do |event|
        output "rachel", event
      end

      protected

      def ArtStuff::output(args, event=nil)
        args = [] << args unless args.kind_of?(Array)
        result = get_art parse_input args
        if !result.nil?
          begin
            raise Discordrb::Errors::NoPermission if event.nil?
            event.channel.send_embed do |embed|
              embed.title = "Artist page"
              embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "Random #{result[:args]} art")
              embed.colour = 0x14506f
              if result[:art].tags.include?("nsfw")
                embed.description = "**[NSFW]**"
              else
                embed.image = Discordrb::Webhooks::EmbedImage.new(url: "#{result[:art].preview}")
              end
              embed.url = "#{result[:art].source}"
              embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: "#{result[:art].tags.include?("nsfw") ? "**[NSFW]**, " : ""}#{result[:count]} results")
              embed.add_field(name: "Tags:", value: "```#{result[:art].tags.reject(&:empty?).join(', ')}```")
            end
          rescue Discordrb::Errors::NoPermission
            random_text result
          end
        else
          'Sorry, got nothing on that.'
        end
      end

      def ArtStuff::get_art(tags)
        art = tags[:inc].blank? ? Art.where(tags: { '$nin' => tags[:exc]}) : Art.where(tags: { '$all' => tags[:inc] }).and(tags: { '$nin' => tags[:exc] })
        count = art.count
        art = art.order_by(last_use: :desc)
        art = count>11 ? art[(count-(count*0.1).ceil)..-1].sample : art.last
        if art.present?
          art.update(:last_use => DateTime.now)
          {:art => art, :args => tags[:raw_input], :count => count}
        else
          nil
        end
      end

      def ArtStuff::parse_input(input)
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

      def ArtStuff::random_text(art)
        "Random #{art[:args]} art (#{art[:count]} results): " << (art[:art].tags.include?("nsfw") ? "[NSFW] <#{art[:art].link}>" : "#{art[:art].link}")
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
