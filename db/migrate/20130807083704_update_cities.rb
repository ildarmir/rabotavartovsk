# coding: utf-8
class UpdateCities < ActiveRecord::Migration
  def change
  City.create(subdomain: "vartovsk", name: "Нижневартовск")
  City.create(subdomain: "langepas", name: "Лангепас")
  City.create(subdomain: "megion", name: "Мегион")
  City.create(subdomain: "raduzhnyi", name: "Радужный")
  City.create(subdomain: "pokachi", name: "Покачи")

  end
end
