require_relative('models/store')
require_relative('models/pet')
require('pry-byebug')



pet = Pet.new({'name' => 'janet', 'type' => 'bear', 'favourite_film' => 'Jaws', 'store_id' => 25}).save


pet = Pet.new({'name' => 'jimbob', 'type' => 'bear', 'favourite_film' => 'Jaws', 'store_id' => 25}).update










