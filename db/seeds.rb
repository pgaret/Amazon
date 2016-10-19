User.create(name: "Jeff", password: "123456", cart_id: 1)
User.create(name: "Mary", password: "788012", cart_id: 2)
User.create(name: "Scott", password: "abc123", cart_id: 3)
User.create(name: "Andy", password: "randompw", cart_id: 4)
User.create(name: "Jenna", password: "pw123456", cart_id: 5)

Item.create(name: "One", description: "First item", price: 1)
Item.create(name: "Two", description: "Second item", price: 2)
Item.create(name: "Three", description: "Third item", price: 3)
Item.create(name: "Four", description: "Fourth item", price: 4)
Item.create(name: "Five", description: "Fifth item", price: 5)

Cart.create(user_id: 1)
Cart.create(user_id: 2)
Cart.create(user_id: 3)
Cart.create(user_id: 4)
Cart.create(user_id: 5)

Review.create(comment: "This is great!", score: 5, user_id: 2, item_id: 3)
