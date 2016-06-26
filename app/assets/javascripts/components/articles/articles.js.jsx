var Articles = React.createClass({
  getInitialState: function() {
    return { articles: this.props.data };
  },

  getDefaultProps: function() {
    return { articles: [] };
  },

  render: function() {
    return(
      <div className='articles'>
        <h2 className='articles_title'>
          Articles
        </h2>
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
