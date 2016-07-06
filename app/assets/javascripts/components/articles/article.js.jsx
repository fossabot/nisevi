var Article = React.createClass({

  getInitialState: function() {
    return { edit: false };
  },

  handleToggle: function(e) {
    e.preventDefault();
    this.setState({ edit: !this.state.edit });
  },

  handleDelete: function(e) {
    $.ajax({
      method: 'DELETE',
      url: '/articles/' + this.props.article.id,
      dataType: 'JSON',
      success: function() {
        this.props.handleDeleteArticle(this.props.article)
      }.bind(this)
    });
  },

  handleEdit: function(e) {
    e.preventDefault();
    var data = { title: React.findDOMNode(this.refs.title).value,
                 date: React.findDOMNode(this.refs.date).value,
                 amount: React.findDOMNode(this.refs.amount).value }
    $.ajax({
      method: 'PUT',
      url: '/articles/' + this.props.article.id,
      dataType: 'JSON',
      data: { article: data },
      success: function(data) {
        this.setState({ edit: false });
        this.props.handleEditArticle(this.props.article, data);
      }.bind(this)
    });
	},

  articleRow: function() {
    return(
      <tr>
        <td>{this.props.article.title}</td>
        <td>{this.props.article.text}</td>
      </tr>
    );
  },

  articleForm: function() {
    return(
      <tr>
        <td>
          <input className='form-control' type='text'
                 defaultValue={this.props.article.title} ref='title'>
          </input>
        </td>
        <td>
          <input className='form-control' type='text'
                 defaultValue={this.props.article.text} ref='text'>
          </input>
        </td>
			</tr>
    );
	},

  renderedArticle: function() {
    if (this.state.edit === true) {
      return this.articleForm();
    } else {
      return this.articleRow();
    }
	},  

  render: function() {
    return this.renderedArticle();
  }
});
