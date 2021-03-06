MyApp.Mixins.SortMixin =

  getInitialState: ->
    { sortAttribute: @props.collection.sortAttribute, sortDirection: @props.collection.sortDirection }

  sortCollection: (attr)->
    newSortDirection = 1
    if @state.sortAttribute == attr
      newSortDirection = @state.sortDirection * -1

    @setState(sortAttribute: attr, sortDirection: newSortDirection)

  sortedData: ->

    sortedData = @getCollection()
    
    sortedData.sortDirection = @state.sortDirection
    sortedData.sortBy(@state.sortAttribute)
    sortedData