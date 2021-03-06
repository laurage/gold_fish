# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Event.destroy_all
User.destroy_all
Booking.destroy_all

10.times do
  user = User.new( {
    email: Faker::Internet.email,
    password: Faker::Number.number(10),
    created_at: nil,
    updated_at: nil,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    picture: Faker::Avatar.image,
    description: "Loves cooking, reading and watching leaves falling from trees",
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number})
  user.save
    5.times do
      time_start = Faker::Time.forward(23, :morning)
      event = Event.new({
        title: Faker::Hipster.sentence(1,true,2),
        time_start: time_start,
        time_end: time_start + 2.hour,
        capacity: Faker::Number.between(1, 100),
        picture: "",
        description: Faker::Lorem.paragraph(2),
        location_title: Faker::Space.planet,
        address_number: Faker::Address.building_number,
        address_street: Faker::Address.street_name,
        address_postcode: Faker::Address.postcode,
        address_city: ["paris", "london", "nantes", "berlin", "bordeaux"].sample,
        address_country: Faker::Address.country,
        distinguishing_feature: Faker::StarWars.vehicle,
        wedding_list: Faker::Beer.name,
        category: ["opera", "food", "fishing"].sample,
        keywords: Faker::Superhero.name,
        price: Faker::Number.between(1, 100),
        user: user
        })
      event.save
    end

end
50.times do
  user = User.new({
    email: Faker::Internet.email,
    password: Faker::Number.number(10),
    created_at: nil,
    updated_at: nil,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    picture: Faker::Avatar.image,
    description: "Loves cooking, reading and watching leaves falling from trees",
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number})
  user.save
  e = Event.last.id
  5.times do
    booking = Booking.new({
      user_id: user.id,
      event_id: [e, e - 1,e - 2, e - 3, e - 4, e - 5, e - 6, e - 7, e - 8,e - 9, e - 10].sample})
    booking.save!
  end
end

