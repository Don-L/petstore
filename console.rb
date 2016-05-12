require_relative('models/store')
require_relative('models/pet')
require('pry-byebug')


Pet.delete_all
Store.delete_all



store1 = Store.new({'name' => 'Big Pet Store', 'address' => 'High Street', 'type' => 'exotic'}).save
store2 = Store.new({'name' => 'Wee Pet Store', 'address' => 'Station Road', 'type' => 'mundane'}).save



pet1 = Pet.new({'name' => 'John', 'type' => 'Bear', 'favourite_film' => 'Jaws', 'store_id' => store1.id}).save
pet2 = Pet.new({'name' => 'Jill', 'type' => 'Chicken', 'favourite_film' => 'Silence of the Lambs', 'store_id' => store2.id}).save




binding.pry
nil







