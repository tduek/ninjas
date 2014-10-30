N.Collections.Ninjas = Backbone.Collection.extend({
  url: '/api/ninjas',

  model: N.Models.Ninja,

  parse: function (resp) {
    if (resp.targets) {
      this.targets().set(resp.targets, { parse: true });
      delete resp.targets
    }

    return resp;
  },

  targets: function () {
    this._targets || (this._targets = new N.Collections.Targets());
    return this._targets;
  }


});