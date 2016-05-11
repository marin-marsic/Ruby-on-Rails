# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "v1",
    email: "vlasniks@vlasniks.hr",
    ime: "Vlasnik",
    prezime: "Prezime",
    password:               "1234",
    password_confirmation:  "1234",
    uloga: 4,
    activated: true,
    activated_at: Time.zone.now)

User.create!(name:  "root",
             email: "root@root2.hr",
             ime: "Urednik",
             prezime: "Prezime",
             password:              "root",
             password_confirmation: "root",
             uloga: 1,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: "u1",
             email: "urednik1@urednik1.hr",
    ime: "Urednik",
    prezime: "Prezime",
             password:               "1234",
             password_confirmation:  "1234",
             uloga: 2,
             activated: true,
    termin_urednika: DateTime.new(2016, 01, 01, 01, 00, 0),
             activated_at: Time.zone.now)

User.create!(name: "u2",
             email: "urednik2@urednik2.hr",
    ime: "Urednik",
    prezime: "Prezime",
             password:               "1234",
             password_confirmation:  "1234",
             uloga: 2,
             activated: true,
             termin_urednika: DateTime.new(2016, 01, 01, 02, 00, 0),
             activated_at: Time.zone.now)

22.times do |n|
  name  = "u#{n+3}"
  ime = Faker::Name.name
  prezime = Faker::Name.name
  User.create!(name:  name,
      ime: ime,
      prezime: prezime,
      uloga: 2,
      termin_urednika: DateTime.new(2016, 01, 01, n+3, 00, 0),
      password:               "1234",
      password_confirmation:  "1234",
      email: "urednik#{n+3}@urednik.hr",
      activated: true,
      activated_at: Time.zone.now)
end

User.create!(name: "a1",
             email: "admin1@admin.hr",
    ime: "Administrator",
    prezime: "Prezime",
             password:               "1234",
             password_confirmation:  "1234",
             uloga: 1,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: "a2",
    ime: "Administrator",
    prezime: "Prezime",
             email: "admin2@admin.hr",
             password:               "1234",
             password_confirmation:  "1234",
             uloga: 1,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: "k1",
    ime: "Korisnik",
    prezime: "Prezime",
             email: "korisnik1@korisnik.hr",
             password:               "1234",
             password_confirmation:  "1234",
             uloga: 3,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: "k2",
    ime: "Korisnik",
    prezime: "Prezime",
             email: "korisnik2@korisnik.hr",
             password:               "1234",
             password_confirmation:  "1234",
             uloga: 3,
             activated: true,
             activated_at: Time.zone.now)

Track.create!(name:  "The Lounge",
    author: "Bensound",
    minute:4, sekunde:16, zanr: "Jazz")

Track.create!(name:  "Jazzy Frenchy",
    author: "Bensound",
    minute:1, sekunde:44, zanr: "Jazz")

Track.create!(name:  "The Jazz Piano",
    author: "Bensound",
    minute:2, sekunde:40, zanr: "Jazz")

Track.create!(name:  "Funky Suspense",
    author: "Bensound",
    minute:4, sekunde:27, zanr: "Funky")

Track.create!(name:  "Retro Soul",
    author: "Bensound",
    minute:3, sekunde:36, zanr: "Funky")

Track.create!(name:  "Going Higher",
    author: "Bensound",
    minute:4, sekunde:04, zanr: "Rock")

Track.create!(name:  "Extreme Action",
    author: "Bensound",
    minute:8, sekunde:03, zanr: "Rock")

Track.create!(name:  "Actionable",
    author: "Bensound",
    minute:2, sekunde:02, zanr: "Rock")

Track.create!(name:  "Groovy Hip Hop",
    author: "Bensound",
    minute:4, sekunde:0, zanr: "Groove")

Track.create!(name:  "Sexy",
    author: "Bensound",
    minute:2, sekunde:53, zanr: "Groove")

Track.create!(name:  "Badass",
    author: "Bensound",
    minute:1, sekunde:49, zanr: "Groove")

Track.create!(name:  "Dubstep",
    author: "Bensound",
    minute:2, sekunde:04, zanr: "Dubstep")

Track.create!(name:  "Pop Dance",
    author: "Bensound",
    minute:2, sekunde:42, zanr: "Pop")

Track.create!(name:  "House",
    author: "Bensound",
    minute:4, sekunde:19, zanr: "House")

Track.create!(name:  "Dance",
    author: "Bensound",
    minute:2, sekunde:57, zanr: "Dance")

Track.create!(name:  "Energy",
    author: "Bensound",
    minute:2, sekunde:59, zanr: "Pop")

Track.create!(name:  "Moose",
    author: "Bensound",
    minute:2, sekunde:40, zanr: "Electro")
