window.N = {
  Views: {},
  Models: {},
  Collections: {},
  Routers: {},
  initialize: function () {
    N.ninjas = new N.Collections.Ninjas();
    N.ninjas.fetch();
    new N.Routers.NRouter($('main'));
    Backbone.history.start();
  }
};

$(document).ready(function () {
  N.initialize();
});