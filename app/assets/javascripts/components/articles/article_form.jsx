var ArticleForm = React.createClass({
  getInitialState: function() {
    return { title: '',
             text: '' }
  },

  handleChange: function(e) {
    var name = e.target.name;
    var obj = {};
    obj[name] = e.target.value;
		this.setState(obj);
  },

  valid: function() {
    return (this.state.title && this.state.text);
  },

  handleSubmit: function(e) {
		e.preventDefault();
    $.post('',
           { article: this.state },
           function(data) {
             this.props.handleNewArticle(data);
             this.setState(this.getInitialState());
           }.bind(this),
           'JSON'
    );
  },

  render: function() {
    return(
      <form className='form-inline' onSubmit={this.handleSubmit}>
        <div className='form-group'>
          <input type='text' className='form-control'
                 placeholder='Title' name='title'
                 value={this.state.title} onChange={this.handleChange}>
          </input>
        </div>
        <div className='form-group'>
          <input type='text' className='form-control'
                 placeholder='Text' name='text'
                 value={this.state.text} onChange={this.handleChange}>
          </input>
        </div>
        <div className='form-group'>
          <input type='submit' className='btn btn-primary'
                 disabled={!this.valid()}>
          </input>
        </div>
      </form>
    );
  }
});
