var Article = React.createClass({

  getInitialState: function() {
    return { edit: false };
  },

  articleRow: function() {
    return(
      <tr>
        <td>{this.props.article.title}</td>
        <td>{this.props.article.text}</td>
      </tr>
    );
  },

  renderedArticle: function() {
    return this.articleRow();
  },
  
  render: function() {
    return this.renderedArticle();
  }
});
