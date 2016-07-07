var Articles = React.createClass({
  getInitialState: function() {
    return { articles: this.props.data };
  },

  getDefaultProps: function() {
    return { articles: [] };
  },

  deleteArticle: function(article) {
    var index = this.state.articles.indexOf(article);
    var articles = React.addons.update(this.state.articles,
                                      { $splice: [[index, 1]] });
    this.replaceState({ articles: articles});
  },

  updateArticle: function(article, data) {
    var index = this.state.articles.indexOf(article);
    var articles = React.addons.update(this.state.articles,
                                      { $splice: [[index, 1, data]] });
    this.replaceState({ articles: articles });
	},

  addArticle: function(article) {
    var articles = React.addons.update(this.state.articles, { $push: [article] })
    this.setState({ articles: articles });
	},

  render: function() {
    return(
      <div className='articles'>
				<ArticleForm handleNewArticle={this.addArticle} />
        <table className='articles_table'>
          <thead>
            <tr>
              <th>Title</th>
              <th>Content</th>
            </tr>
          </thead>
          <tbody>
            {this.state.articles.map(function(article) {
              return <Article key={article.id} article={article}/>
             }.bind(this))}
          </tbody>
        </table>
      </div>
    );
  }
});
