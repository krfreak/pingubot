require 'bundler/setup'
require 'mongoid'
require 'discordrb'
require 'json'

module Bot
  cfg_file = File.read('config/config.json')
  CFG = JSON.parse(cfg_file)

  Mongoid.logger.level = Logger::DEBUG
  Mongo::Logger.logger.level = Logger::DEBUG
  Mongoid.load!('config/mongoid.yml', :development)

  BOT = Discordrb::Commands::CommandBot.new token: CFG['token'], client_id: CFG['app_id'], prefix: CFG['prefix']

  module Fish; end
  Dir['fish/*.rb'].each { |fish| load fish }
  Fish.constants.each do |fish|
    BOT.include! Fish.const_get fish
  end

  BOT.command(:reload, help_available: false) do |event|
    break unless event.user.id == CFG['owner_id']
    Dir['fish/*.rb'].each { |fish| load fish }
    Fish.constants.each do |fish|
      BOT.include! Fish.const_get fish
    end
  end

  BOT.command(:ping, description: "measure this bot's response time") do |event|
    m = event.respond('Pong!')
    m.edit "Pong! Time taken: #{Time.now - event.timestamp} seconds."
    nil
  end

  BOT.command(:exit, help_available: false) do |event|
    break unless event.user.id == CFG['owner_id'] # Replace number with your ID

    BOT.send_message(event.channel.id, 'Shutting down.')
    exit
  end

  BOT.command(:grantpermission, help_available: false) do |event, *args|
    break unless event.user.id == CFG['owner_id']
    BOT.set_role_permission(id, args[0])
    event.respond('Done.')
    nil
  end

  BOT.run
end
