class EventsProcessor < ApplicationProcessor

  @@batchMax   = 5
  @@batchQueue = []
  @@maxQueueLifetime = 30 # seconds
  @@queueBirthdate   = nil
  
  subscribes_to :events, {:ack => 'client'}

  def on_message(message)
    if @@batchQueue.empty? then
      @@queueBirthdate = Time.now
    end

    queueLifetime = Time.now - @@queueBirthdate

    if @@batchQueue.length >= @@batchMax or queueLifetime >= @@maxQueueLifetime then
      flush_queue
    else
      queue_message message
    end
  end

  def queue_message(message)
    logger.debug "Queueing message:  #{message}"
    @@batchQueue << message
    puts "length = #{@@batchQueue.length}"
  end

  def flush_queue
    logger.debug "Flush queue:"
    @@batchQueue.each {|msg| puts "Flushing #{msg}"}
    @@batchQueue.clear
  end

end
