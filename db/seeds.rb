
jason = Curator.create(name: "Jason")
phil = Curator.create(name: "Phil")
maggie = Curator.create(name: "Maggie")
james = Curator.create(name: "James")
bobo = Curator.create(name: "Bobo")
happy = Curator.create(name: "Happy")

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}.jpg"))
end

jason_collection = Collection.create(title: "Videogames", description: "Great Scott!", curator_id: jason.id)


maggie_collection = Collection.create(title: "Afros", description: "Great Scott!", curator_id: jason.id)

phil_collection = Collection.create(title: "Pizzas", description: "Great Scott!", curator_id: jason.id)

jason_observation = Observation.create(description: "Games!", curator_id: jason.id, collection_id: jason_collection.id)

maggie_observation = Observation.create(description: "Afros!", curator_id: maggie.id, collection_id: maggie_collection.id)

phil_observation = Observation.create(description: "Pizza!", curator_id: phil.id, collection_id: phil_collection.id)

jason_observation.image = File.open(File.expand_path("../fixtures/photos/game.jpg", __FILE__))
jason_observation.save

phil_observation.image = File.open(File.expand_path("../fixtures/photos/pizza.jpg", __FILE__))
phil_observation.save

maggie_observation.image = File.open(File.expand_path("../fixtures/photos/afro.jpg", __FILE__))
maggie_observation.save

Role.create(curator_id: phil.id, collection_id: jason_collection.id, can_create: true)

Role.create(curator_id: maggie.id, collection_id: jason_collection.id, can_read: true)

Role.create(curator_id: james.id, collection_id: jason_collection.id, can_update: true)

Role.create(curator_id: bobo.id, collection_id: jason_collection.id, can_invite: true)

Role.create(curator_id: happy.id, collection_id: jason_collection.id, admin: true)
