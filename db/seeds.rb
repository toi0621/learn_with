# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create(name: '数学') unless Genre.exists?(name: '数学')
Genre.create(name: '英語') unless Genre.exists?(name: '英語')
Genre.create(name: '古文') unless Genre.exists?(name: '古文')
Genre.create(name: '現代文') unless Genre.exists?(name: '現代文')
Genre.create(name: '地理') unless Genre.exists?(name: '地理')
Genre.create(name: '歴史') unless Genre.exists?(name: '歴史')
Genre.create(name: '化学') unless Genre.exists?(name: '化学')
Genre.create(name: 'プログラミング') unless Genre.exists?(name: 'プログラミング')
Genre.create(name: '簿記') unless Genre.exists?(name: '簿記')
Genre.create(name: 'FP') unless Genre.exists?(name: 'FP')