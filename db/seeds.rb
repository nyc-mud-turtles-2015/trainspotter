jason = Curator.create(name: "Jason")

nando = Collection.create(title: "Marty and Doc", description: "Great Scott!", curator_id: jason.id)


Observation.create(description: "Back to the Future!", curator_id: jason.id, collection_id: nando.id)
