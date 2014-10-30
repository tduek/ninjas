N.Views.NinjasIndex = Backbone.View.extend({
  initialize: function () {
    this.ninjas = N.ninjas;
    this.listenTo(this.ninjas, 'sync', this.render);
  },

  template: JST["ninjas/index"],

  render: function () {
    var renderedContent = this.template({
      ninjas: this.ninjas
    });

    this.$el.html(renderedContent);
    return this;
  }
});