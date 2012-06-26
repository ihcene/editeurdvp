# -*- coding: utf-8 -*-

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

path = File.join(Rails.root, "db", "seeds", "columns.csv")

CSV.foreach(path, :encoding => 'utf-8', :quote_char => '"', :col_sep =>';', :row_sep => :auto) do |row|
  Column.create(
    :id_dvp   => row[0],
    :title    => row[1], 
    :url      => row[2]
  )
end