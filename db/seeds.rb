require_relative('../models/pokemon')
require_relative('../models/trainer')
require('pry-byebug')

trainer1 = Trainer.new(
  "name" => "Ash Ketchum"
)

  trainer1.save()

pokemon1 = Pokemon.new(
"name" => "Jimmy",
"breed" => "Pikachu",
"date_arrived" => 20161125,
"trainerid" => trainer1.id
  )


pokemon1.save()