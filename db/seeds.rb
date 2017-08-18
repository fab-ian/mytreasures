Treasure.destroy_all
Warehouse.destroy_all
PaperTrail::Version.destroy_all

User.create(name: 'Admin', email: 'admin@naibaf.pl', password: 'adminadmin2017', roles_mask: 1)

Warehouse.create(
  name: 'My first Warehouse',
  description: 'Change the name of this Warehouse and add a better description :)'
)
puts 'Seeds has been imported successfully.'
