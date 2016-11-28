require_relative('../models/pokemon')
require_relative('../models/trainer')
require('pry-byebug')

Pokemon.delete_all()
Trainer.delete_all()


trainer1 = Trainer.new(
  "name" => "Bob Saget"
  )

trainer2 = Trainer.new(
  "name" => "Ash Ketchum"
)

  trainer1.save()
  trainer2.save()

pokemon1 = Pokemon.new(
"name" => "Jimmy",
"breed" => "Pikachu",
"date_arrived" => 20161125
  )


pokemon1.save()