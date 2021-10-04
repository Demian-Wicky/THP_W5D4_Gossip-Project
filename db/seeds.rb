City.delete_all
User.delete_all
Gossip.delete_all
JoinTableGossipsTag.delete_all
Tag.delete_all



############################################
# NUMBERS

nb_city = 10
nb_user = 10
nb_gossip = 20
nb_tag = 10
nb_jointablegossipstag = 60


###########################################
# CITIES

nb_city.times do |i|
  City.create!(
    name: Faker::Address.city,
  )
end
  puts "#{nb_city} cities created!"

############################################
# USERS

nb_user.times do |i|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Hipster.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
    email: Faker::Internet.email,
    age: Faker::Number.within(range: 12..112),
    city_id: City.all.shuffle.last.id,
  )
end
puts "#{nb_user} users created!"



############################################
# GOSSIP

nb_gossip.times do |i|
  user = User.all.shuffle.last
  Gossip.create!(
    title: Faker::Hipster.sentence(word_count: 2, supplemental: true),
    content: Faker::Hipster.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
    user_id: user.id,
  )
end

puts "#{nb_gossip} gossips cooked up!"


###########################################
# TAGS

nb_tag.times do |i|
  Tag.create!(
    title: Faker::Hipster.word,
  )
end

puts "#{nb_tag} tags created!"


###########################################
# JOIN_TABLE_GOSSIPS_TAG

nb_jointablegossipstag.times do |i|
  gossip = Gossip.all.shuffle.last
  tag = Tag.all.shuffle.last
  JoinTableGossipsTag.create!(
    gossip_id: gossip.id,
    tag_id: tag.id,
  )
end

puts "#{nb_jointablegossipstag} jointable entries created!"

############################################

puts "Hooray! Seeding done 👌"