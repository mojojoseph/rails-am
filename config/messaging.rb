ActiveMessaging::Gateway.define do |s|
  
  s.destination :events, '/queue/inbound'
  
end
