N.Views.NinjaLI = Backbone.View.extend({
  template: JST['ninjas/li'],

  tagName: 'li',

  initialize: function (ninja) {
    this.ninja = ninja;
  },

  render: function () {
    var renderedContent = this.template({ninja: this.ninja});

    this.$el.html(renderedContent);

    return this;
  }
});