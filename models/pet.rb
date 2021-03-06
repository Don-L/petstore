require('pg')
require_relative('../db/sql_runner.rb')

class Pet

  attr_accessor(:name, :type, :favourite_film)
  attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @favourite_film = options['favourite_film']
    @store_id = options['store_id'].to_i
  end

  def save()
    sql = "INSERT INTO pets (name, type, favourite_film, store_id) VALUES ('#{@name}', '#{type}', '#{favourite_film}', #{@store_id}) RETURNING *"
    pet = SqlRunner.run(sql).first
    result = Pet.new(pet)
    return result
  end

  def update(hash)  #enter hash = {options[key] => new_value}
    sql = "UPDATE pets
          SET #{hash.keys[0]} = '#{hash.values[0]}'
          WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM pets"
    SqlRunner.run(sql)
  end

  def delete() 
    sql = "DELETE FROM pets WHERE id = #{@id}"
    SqlRunner.run(sql)
  end


  def self.all()
    sql = "SELECT * FROM pets"
    pets = SqlRunner.run(sql)
    return pets.map {|pet| Pet.new(pet)}
  end

end