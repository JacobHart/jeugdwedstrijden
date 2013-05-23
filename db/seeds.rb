Boat.destroy_all
BoatType.destroy_all
Club.destroy_all
Heat.destroy_all
Result.destroy_all
Rower.destroy_all
RowerClassification.destroy_all
TeamClassification.destroy_all
Team.destroy_all

# heb nog geen multiple heats bij teams! Kan het wel :)
# club id nog matchen met teams   later..
# 4 viertjes = 16 rowers

a = Admin.new
  a.name = "admin"
  a.password = "havenstraat"
  a.save


16.times do |index|
  r = Rower.new
  r.name = ["Daan", "Sem", "Milan", "Levi", "Luuk", "Lucas", "Jayden", "Thomas", "Emma", "Julia", "Sophie", "Lotte", "Isa", "Lisa", "Saar", "Lieke"][index]
  r.age = (10 + rand(8)).to_s
  r.club_id = 1
  r.save
end

16.times do |index|
  r = Rower.new
  r.name = ["Stijn", "Jesse", "Finn", "Ruben", "Tim", "Thijs", "Lars", "Bram", "Eva", "Anna", "Sara", "Fleur", "Sanne", "Tess", "Lynn", "Noa"][index]
  r.age = (10 + rand(8)).to_s
  r.club_id = 2
  r.save
end
# 8 tweetjes = 16 rowers hergebruiken van boven

# 16 skifjes = 16 rowers hergebruiken van boven


28.times do |index|
  t = Team.new
  t.name = ("ZZV " + index.to_s)
  t.boat_type_id = (rand(32) + 1)
  t.club_id = 1
  t.save
end

28.times do |index|
  t = Team.new
  t.name = ("Amstel " + (index+28).to_s)
  t.boat_type_id = (rand(32) + 1)
  t.club_id = 2
  t.save
end

["J10 1x","J11 1x","J12 1x","J13 1x","J14 1x","M10 1x","M11 1x","M12 1x","M13 1x","M14 1x","J12 2x","M12 2x","J14 2x","M14 2x","J12 C4*","M12 C4*","Mix12 C4*","J14 C4*","M14 C4*","Mix14 C4*","J16 4x","J18 4x","M16 4x","M18 4x","Mixed16 4x","Mixed18 4x","J16 C4*","J18 C4*","M16 C4*","M18 C4*","Mixed16 C4*","Mixed18 C4*"].each do |boattype|
  b = BoatType.new
  b.name = boattype
  b.save
end






  c = Club.new
  c.name = "ZZV"
  c.save

  c = Club.new
  c.name = "Amstel"
  c.save

12.times do |index|
  b = Boat.new
  b.name = ("Boat " + index.to_s)
  b.save
end

# later name = timeslot instead of number
14.times do |index|
  h = Heat.new
  h.name = ["Heat 9:30", "Heat 10:00", "Heat 10:30", "Heat 11:30", "Heat 12:00", "Heat 12:30", "Heat 13:00", "Heat 13:30", "Heat 14:00", "Heat 14:30", "Heat 15:00", "Heat 15:30", "Heat 16:00", "Heat 16:30"][index]
  h.save
end


# 3*16=48 rijen   0-15 rowers id's    0-27 team id
16.times do |index|
  r = RowerClassification.new
  r.rower_id = (index + 1).to_s
  r.team_id = ((index / 4) + 1).to_s
  r.save
end

16.times do |index|
  r = RowerClassification.new
  r.rower_id = (index + 1).to_s
  r.team_id = (index / 2 + 5).to_s
  r.save
end

16.times do |index|
  r = RowerClassification.new
  r.rower_id = (index + 1).to_s
  r.team_id = (13 + index).to_s
  r.save
end

16.times do |index|
  r = RowerClassification.new
  r.rower_id = (index + 17).to_s
  r.team_id = ((index / 4) + 29).to_s
  r.save
end

16.times do |index|
  r = RowerClassification.new
  r.rower_id = (index + 17).to_s
  r.team_id = (index / 2 + 33).to_s
  r.save
end

16.times do |index|
  r = RowerClassification.new
  r.rower_id = (index + 17).to_s
  r.team_id = (41 + index).to_s
  r.save
end

# 0-27 teams    0-6 heats
  teamarray = (1..56).to_a.shuffle!
56.times do |index|
  t = TeamClassification.new

  t.team_id = teamarray.pop
  t.heat_id = (index/4 + 1).to_s
  t.boat_id = (index%12 + 1).to_s
  t.save
end

28.times do |index|
laptimesarray =  (130 .. 330).to_a.shuffle!
teaminheat = TeamClassification.where(heat_id: index/4).map{|x| x.team_id}[index%4]
    r = Result.new
    r.laptime = (laptimesarray.pop / 100.00)
    r.team_id = teaminheat
    r.heat_id = (index / 4)
    r.save
end

puts "There are now #{Boat.count} Boats in the database"
puts "There are now #{Boat.count} Boats in the database"
puts "There are now #{BoatType.count} BoatTypes in the database"
puts "There are now #{Club.count} Clubs in the database"
puts "There are now #{Heat.count} Heats in the database"
puts "There are now #{Result.count} Results in the database"
puts "There are now #{Rower.count} Rowers in the database"
puts "There are now #{RowerClassification.count} RowerClassifications in the database"
puts "There are now #{TeamClassification.count} TeamClassifications in the database"
puts "There are now #{Team.count} Teams in the database"
