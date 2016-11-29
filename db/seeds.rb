require_relative('../models/pokemon')
require_relative('../models/trainer')
require('pry-byebug')

Pokemon.delete_all()
Trainer.delete_all()


trainer1 = Trainer.new(
  "name" => "Bob Saget"
  )
  trainer1.save()

pokemon1 = Pokemon.new(
"name" => "Jimmy",
"breed" => "Pikachu",
"date_arrived" => 20161125,
"picture" => "http://vignette2.wikia.nocookie.net/pokemon/images/b/b1/025Pikachu_XY_anime_3.png/revision/latest?cb=20140902050035"
  )


pokemon1.save()