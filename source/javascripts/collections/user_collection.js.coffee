MyApp.Collections.Users = Backbone.Collection.extend
  url: 'http://jsonplaceholder.typicode.com/users'
  model: MyApp.Models.User

  sortAttribute: 'name'
  sortDirection: 1

  sortTypes:
    'name' : 'Name'
    'website' : 'Website'

  sortBy: (attr) ->
    @sortAttribute = attr
    @sort()
    return


  comparator: (a, b) ->
    a = a.get(@sortAttribute)
    b = b.get(@sortAttribute)

    return 0 if a is b 
    if @sortDirection is 1
      (if a > b then 1 else -1)
    else
      (if a < b then 1 else -1)

