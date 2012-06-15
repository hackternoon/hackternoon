FactoryGirl.define do
  factory :invitation do |f|
    f.msg  'I invite you to my project.'
    f.rcvr_email 'rcvr@cnn.com'
    f.association :project
  end
end
