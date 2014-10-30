N.Collections.SearchResults = Backbone.Collection.extend({

  model: function (attrs) {
    var type = attrs._type;
    delete attrs._type;

    if (type === 'Ninja') {
      return new N.Models.Ninja(attrs);
    } else if (type === 'Target') {
      return new N.Models.Target(attrs);
    } else {
      return new Backbone.Model(attrs)
    }
  },

  url: '/api/search'


});