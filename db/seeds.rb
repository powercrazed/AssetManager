# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create people
people = Person.create([
    {
        first_name: "Michaela",
        last_name: "Haggard",
        location: "Office 1"
    },
    {
        first_name: "Brandon",
        last_name: "Leon",
        location: "Office 1"
    },
    {
        first_name: "Anthony",
        last_name: "Kelly",
        location: "Office 2"
    },
    {
        first_name: "Laura",
        last_name: "Foster",
        location: "Office 1"
    },
    {
        first_name: "Isaac",
        last_name: "Sanders",
        location: "Home"
    }])

# create devices
devices = Device.create([
    {
        name: "desk-0001",
        tag: 1,
        dev_type: "Desktop",
        make: "Dell",
        model: "Vostro 470 mt",
        serial: "12345",
        purchased_on: "2015-11-10",
        warranty_length: 3,
        warranty_type: "NBD",
        person_id: people[0].id
    },
    {
        name: "desk-0035",
        tag: 35,
        dev_type: "Dev Desktop",
        make: "Dell",
        model: "Optiplex 9020",
        serial: "12346",
        purchased_on: "2015-09-15",
        warranty_length: 3,
        warranty_type: "NBD",
        person_id: people[1].id
    },
    {
        name: "lap-0111",
        tag: 111,
        dev_type: "Laptop",
        make: "Dell",
        model: "XPS 13",
        serial: "12347",
        purchased_on: "2013-05-05",
        warranty_length: 3,
        warranty_type: "NBD",
        person_id: people[4].id
    },
    {
        name: "lap-0002",
        tag: 2,
        dev_type: "Laptop",
        make: "Microsoft",
        model: "Surface 6 Pro",
        serial: "a3d321112",
        purchased_on: "2019-05-05",
        warranty_length: 1,
        warranty_type: "CAR",
        person_id: nil
    },
    {
        name: "desk-0004",
        tag: 4,
        dev_type: "Desktop",
        make: "HP",
        model: "elitedesk 800",
        serial: "443322e44442",
        purchased_on: "2018-12-12",
        warranty_length: 3,
        warranty_type: "NBD",
        person_id: nil
    }
])

# create licences
Licence.create(
    vendor: "Microsoft",
    app_name: "Windows",
    version: "10",
    edition: "Professional",
    channel: "OEM",
    purchased_from: "Dell",
    purchased_on: "2015-11-10",
    device_id: devices[0].id,
    person_id: nil,
    in_use: true)

Licence.create(
    vendor: "Microsoft",
    app_name: "Windows",
    version: "10",
    edition: "Professional",
    channel: "OEM",
    purchased_from: "Dell",
    purchased_on: "2015-09-15",
    device_id: devices[1].id,
    person_id: nil,
    in_use: true)

Licence.create(
    vendor: "Microsoft",
    app_name: "Windows",
    version: "8",
    edition: "Professional",
    channel: "OEM",
    purchased_from: "Dell",
    purchased_on: "2013-05-05",
    device_id: devices[2].id,
    person_id: nil,
    in_use: true)

Licence.create(
    vendor: "Adobe",
    app_name: "Creative Cloud",
    version: "n/a",
    edition: "n/a",
    channel: "Subscritpion",
    purchased_from: "Adobe",
    purchased_on: "2016-01-06",
    device_id: nil,
    person_id: nil,
    in_use: false)

Licence.create(
    vendor: "Microsoft",
    app_name: "Office",
    version: "365",
    edition: "Business",
    channel: "Subscription",
    purchased_from: "Reseller 1",
    purchased_on: "2015-10-02",
    device_id: nil,
    person_id: people[0].id,
    in_use: true)

Licence.create(
    vendor: "Microsoft",
    app_name: "Office",
    version: "365",
    edition: "Business",
    channel: "Subscription",
    purchased_from: "Reseller 1",
    purchased_on: "2015-10-02",
    device_id: nil,
    person_id: people[1].id,
    in_use: true)

Licence.create(
    vendor: "Microsoft",
    app_name: "Visual Studio",
    version: "2015",
    edition: "Professional",
    channel: "OLV",
    purchased_from: "Reseller 1",
    purchased_on: "2016-08-20",
    device_id: nil,
    person_id: people[3].id,
    in_use: true)

# create users
User.create(
    email: "test@test.com",
    password: "test123",
    password_confirmation: "test123")
User.create(
    email: "test2@test.com",
    password: "test456",
    password_confirmation: "test456")
