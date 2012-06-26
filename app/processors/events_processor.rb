class EventsProcessor < ApplicationProcessor

  subscribes_to :events

  def on_message(message)
    puts "Message! #{message}"
  end

end
