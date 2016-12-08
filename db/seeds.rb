# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p = []
p[0] = Person.create(first_name: "Michaela", last_name: "Haggard", location: "Office 1")
p[1] = Person.create(first_name: "Brandon", last_name: "Leon", location: "Office 1")
p[2] = Person.create(first_name: "Anthony", last_name: "Kelly", location: "Office 2")
p[3] = Person.create(first_name: "Laura", last_name: "Foster", location: "Office 1")
p[4] = Person.create(first_name: "Isaac", last_name: "Sanders", location: "Home")

d = []
d[0] = Device.create(name: "desk-0001", tag: 1, dev_type: "Desktop", make: "Dell", model: "Vostro 470 mt", serial: "12345", purchased_on: "2015-11-10", warranty_length: 3, warranty_type: "NBD", person_id: p[0].id)
d[1] = Device.create(name: "desk-0035", tag: 35, dev_type: "Dev Desktop", make: "Dell", model: "Optiplex 9020", serial: "12346", purchased_on: "2015-09-15", warranty_length: 3, warranty_type: "NBD", person_id: p[1].id)
d[2] = Device.create(name: "lap-0111", tag: 111, dev_type: "Laptop", make: "Dell", model: "XPS 13", serial: "12347", purchased_on: "2013-05-05", warranty_length: 3, warranty_type: "NBD", person_id: p[4].id)

Licence.create(vendor: "Microsoft", app_name: "Windows", version: "10", edition: "Professional", channel: "OEM", purchased_from: "Dell", purchased_on: "2015-11-10", device_id: d[0].id, person_id: nil, in_use: true)
Licence.create(vendor: "Microsoft", app_name: "Windows", version: "10", edition: "Professional", channel: "OEM", purchased_from: "Dell", purchased_on: "2015-09-15", device_id: d[1].id, person_id: nil, in_use: true)
Licence.create(vendor: "Microsoft", app_name: "Windows", version: "8", edition: "Professional", channel: "OEM", purchased_from: "Dell", purchased_on: "2013-05-05", device_id: d[2].id, person_id: nil, in_use: true)
Licence.create(vendor: "Adobe", app_name: "Creative Cloud", version: "n/a", edition: "n/a", channel: "Subscritpion", purchased_from: "Adobe", purchased_on: "2016-01-06", device_id: nil, person_id: nil, in_use: false)
Licence.create(vendor: "Microsoft", app_name: "Office", version: "365", edition: "Business", channel: "Subscription", purchased_from: "Reseller 1", purchased_on: "2015-10-02", device_id: nil, person_id: p[0].id, in_use: true)
Licence.create(vendor: "Microsoft", app_name: "Office", version: "365", edition: "Business", channel: "Subscription", purchased_from: "Reseller 1", purchased_on: "2015-10-02", device_id: nil, person_id: p[1].id, in_use: true)
Licence.create(vendor: "Microsoft", app_name: "Visual Studio", version: "2015", edition: "Professional", channel: "OLV", purchased_from: "Reseller 1", purchased_on: "2016-08-20", device_id: nil, person_id: p[3].id, in_use: true)
