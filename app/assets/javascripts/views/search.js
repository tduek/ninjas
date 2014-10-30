N.Views.Search = Backbone.View.extend({
  initialize: function () {
    this.results = new N.Collections.SearchResults();
    this.listenTo(this.results, 'sync', this.render);
  },

  template: JST['search'],

  events: {
    'click button': 'search',
    'click .next': 'next'
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);

    var resultsContainer = this.$('#search-results');
    this.results.each(function (result) {
      var view;
      if (result.constructor === N.Models.Target) {
        view = new N.Views.TargetLI(result);
      } else {
        view = new N.Views.NinjaLI(result);
      }

      resultsContainer.append(view.render().$el);
    });

    return this;
  },

  search: function (event) {
    event.preventDefault();
    this.page = 1;
    this.query = this.$('input').val();
    this.results.fetch({
      data: {
        query: this.query
      }
    });
  },

  next: function (event) {
    event.preventDefault();
    if (!this.page) {
      this.page = 1;
    }

    this.page++;
    this.results.fetch({
      data: {
        query: this.query,
        page: this.page
      }
    })
  }
});