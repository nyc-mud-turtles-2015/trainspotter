jason = Curator.create(name: "Jason")


jason.collections.create(title: "Caffeine Trips", description: "My descent into caffeine overload", curator_id: 1)

# jason.observations.create(description: "I love this", curator_id:1, collection_id: 1, image: File.open(File.expand_path("../fixtures/photos/map.jpg", __FILE__)) )
