require File.dirname(__FILE__) + '/../test_helper'
require 'activemessaging/test_helper'
require File.dirname(__FILE__) + '/../../app/processors/application_processor'

class EventsProcessorTest < Test::Unit::TestCase
  include ActiveMessaging::TestHelper
  
  def setup
    load File.dirname(__FILE__) + "/../../app/processors/events_processor.rb"
    @processor = EventsProcessor.new
  end
  
  def teardown
    @processor = nil
  end  

  def test_events_processor
    @processor.on_message('Your test message here!')
  end
end