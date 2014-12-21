{thead, table, tbody, th, td, tr, i} = React.DOM

SortableTable = React.createFactory React.createClass
  mixins: [Backbone.React.Component.mixin]

  sortCollection: (sort_key)->
    @props.sortCollection(sort_key)

  render: ->
    table className: 'table table-bordered table-hover',
      thead {},
        _.map @getCollection().sortTypes, (sortTitle, sortKey) =>
          th onClick: @sortCollection.bind(@, sortKey), key: sortKey,
            sortTitle
            ' '
            if @getCollection().sortAttribute == sortKey
              if @getCollection().sortDirection == 1
                i className: 'fa fa-caret-down'
              else
                i className: 'fa fa-caret-up'

      tbody {},
        @getCollection().map (model)=>
          tr key: model.get('id'),
            _.map @getCollection().sortTypes, (sortTitle, sortKey) =>
              td key: sortKey, model.get(sortKey)

MyApp.Views.SortableTable = SortableTable