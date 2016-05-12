require('pg')
require_relative('../db/sql_runner.rb')

class Store

  attr_accessor(:name, :address, :stock_type, :id)
  # attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
    @stock_type = options['stock_type']
  end

  def save()
    sql = "INSERT INTO stores (name, address, stock_type) VALUES ('#{@name}', '#{address}', '#{stock_type}') RETURNING *"
    store = SqlRunner.run(sql).first
    result = Store.new(store)
    return result
  end

  def self.find(id) 
    sql = "SELECT * FROM stores WHERE id = #{id}"
    store = SqlRunner.run(sql).first
    result = Store.new(store)
    return result
  end

  def update(hash)  #enter hash = {options[key] => new_value}
    sql = "UPDATE stores
          SET #{hash.keys[0]} = '#{hash.values[0]}'
          WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM stores"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM stores WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM stores"
    stores = SqlRunner.run(sql)
    return stores.map {|store| Store.new(store)}
  end

end




















