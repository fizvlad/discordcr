# This simple example bot creates a message whenever a new user joins the server

require "../src/discordcr"

# Make sure to replace this fake data with actual data when running.
client = Discord::Client.new(token: "Bot MjI5NDU5NjgxOTU1NjUyMzM3.Cpnz31.GQ7K9xwZtvC40y8MPY3eTqjEIXm", client_id: 229459681955652337_u64)
cache = Discord::Cache.new(client)
client.cache = cache

client.on_message_create do |payload|
  if payload.content.starts_with? "!check"
    begin
      vs = cache.resolve_voice_state(payload.guild_id.not_nil!, payload.author.id)
      client.create_message(payload.channel_id, "Your voice state: #{vs}")
    rescue exception
      client.create_message(payload.channel_id, "No voice state")
    end
  end
end

client.run
