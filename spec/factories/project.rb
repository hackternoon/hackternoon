# I use this file to make @project via factory girl:
# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
# This will guess the Project class
FactoryGirl.define do
  factory :project do
    name  'Tofu Mind Reader'
    dscrptn 'Uses Tofu Bio-Plugin to both transmit and receive massive brain waves.'
    github_url 'http://github.com/hackternoon/hackternoon'
    tech_tag1 'bio plugin'
    tech_tag2 'brain tech'
    tech_tag3 ''
    biz_tag1 'mind reading monetization'
    biz_tag2 ''
    biz_tag3 ''
  end
end
