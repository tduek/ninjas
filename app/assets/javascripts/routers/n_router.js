N.Routers.NRouter = Backbone.Router.extend({

  initialize: function ($el) {
    this.$el = $el;
  },

  routes: {
    "": "index",
    "search": "search"
  },

  index: function () {
    var indexView = new N.Views.NinjasIndex();
    this._swapView(indexView);
  },

  search: function () {
    var searchView = new N.Views.Search();
    this._swapView(searchView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this.$el.html(view.render().$el);
  }

});