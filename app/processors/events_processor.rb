class EventsProcessor < ApplicationProcessor

  subscribes_to :events

  @@count = 0

  def on_message(message)
    @@count += 1
    logger.debug "message received - count = #{@@count}"
    e = Event.new
    e.save
  end

end
