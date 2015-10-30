jason = Curator.create(name: "Jason")

collection = jason.collections.create(title: "Marty and Doc", description: "Great Scott!")

collection.observations.create(description: "Back to the Future!", image: open("http://vignette2.wikia.nocookie.net/bttf/images/d/d2/Back_to_the_Future.jpg/revision/latest?cb=20070218045421"))
