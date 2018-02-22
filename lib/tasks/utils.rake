namespace :utils do
  desc "Insert to database."
  task seed: :environment do
    puts 'Generando contactos...'
    10.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        rmk: Faker::Lorem.paragraph([1,2,3,4,5].sample)
        )
    end
    puts 'Generando contactos (Contacts)... [OK]'

    puts 'Generando direcciones (Addresses)...'
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        contact: contact
      )
    end
    puts 'Generando direcciones (Addresses)... [OK]'

    puts 'Generando telefonos (Phones)...'
    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: contact
        )
      end
    end
    puts 'Generando telefonos (Phones)... [OK]'
  end

end
