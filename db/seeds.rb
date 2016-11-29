require_relative('../models/pokemon')
require_relative('../models/trainer')
require('pry-byebug')

Pokemon.delete_all()
Trainer.delete_all()


trainer1 = Trainer.new(
  "name" => "Will"
  )

trainer2 = Trainer.new(
  "name" => "Hannah"
  )

trainer3 = Trainer.new(
  "name" => "Jane"
  )

trainer4 = Trainer.new(
  "name" => "Snoop Dogg"
  )

  trainer1.save()
  trainer2.save()
  trainer3.save()
  trainer4.save()

pokemon1 = Pokemon.new(
"name" => "Jimmy",
"breed" => "Pikachu",
"date_arrived" => '2016-11-25',
"picture" => "http://vignette2.wikia.nocookie.net/pokemon/images/b/b1/025Pikachu_XY_anime_3.png/revision/latest?cb=20140902050035"
  )

pokemon2 = Pokemon.new(
"name" => "Cumberbatch",
"breed" => "Bulbasaur",
"date_arrived" => '2016-10-18',
"picture" => "http://cdn.bulbagarden.net/upload/thumb/2/21/001Bulbasaur.png/250px-001Bulbasaur.png"
  )

pokemon3 = Pokemon.new(
"name" => "Jiggles",
"breed" => "Jigglypuff",
"date_arrived" => '2016-10-07',
"picture" => "http://i2.kym-cdn.com/photos/images/original/001/112/200/5e7.png"
  )

pokemon4 = Pokemon.new(
"name" => "Rat puss",
"breed" => "Rattata",
"date_arrived" => '2016-09-24',
"picture" => "http://www.pokemon3d.net/wiki/images/c/c4/Rattata.png"
  )

pokemon1.save()
pokemon2.save()
pokemon3.save()
pokemon4.save()