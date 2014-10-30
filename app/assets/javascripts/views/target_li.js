N.Views.TargetLI = Backbone.View.extend({
  template: JST['targets/li'],

  initialize: function (target) {
    this.target = target;
  },

  tagName: 'li',

  render: function () {
    var renderedContent = this.template({target: this.target});

    this.$el.html(renderedContent);

    return this;
  }
});