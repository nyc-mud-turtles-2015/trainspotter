
jason = Curator.create(name: "Jason")
phil = Curator.create(name: "Phil")
maggie = Curator.create(name: "Maggie")
james = Curator.create(name: "James")
bobo = Curator.create(name: "Bobo")
happy = Curator.create(name: "Happy")

jason_collection = Collection.create(title: "Marty and Doc", description: "Great Scott!", curator_id: jason.id)

Observation.create(description: "Back to the Future!", curator_id: jason.id, collection_id: jason_collection.id)

Role.create(curator_id: phil.id, collection_id: jason_collection.id, can_create: true)

Role.create(curator_id: maggie.id, collection_id: jason_collection.id, can_read: true)

Role.create(curator_id: james.id, collection_id: jason_collection.id, can_update: true)

Role.create(curator_id: bobo.id, collection_id: jason_collection.id, can_invite: true)

Role.create(curator_id: happy.id, collection_id: jason_collection.id, admin: true)
