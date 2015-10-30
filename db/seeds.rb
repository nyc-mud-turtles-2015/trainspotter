jason = Curator.create(name: "Jason")

Collection.create(title: "Marty and Doc", description: "Great Scott!", curator_id: 5)

Observation.create(description: "Back to the Future!", curator_id: 5, collection_id: 1, image: open("http://vignette2.wikia.nocookie.net/bttf/images/d/d2/Back_to_the_Future.jpg/revision/latest?cb=20070218045421"))
