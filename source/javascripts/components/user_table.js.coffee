{div, p, h1} = React.DOM

UserTable = React.createFactory React.createClass
  mixins: [
    Backbone.React.Component.mixin
    MyApp.Mixins.SortMixin
  ]

  render: ->
    div className: 'row',
      div className: 'col-xs-12',
        h1 {}, 'Backbone React Sortable Table Screencast'
        MyApp.Views.SortableTable(data: @sortedData(), sortCollection: @sortCollection)


users = new MyApp.Collections.Users

users.fetch().done ->
  React.render UserTable(collection: users), document.getElementById('home-page-wrapper')

