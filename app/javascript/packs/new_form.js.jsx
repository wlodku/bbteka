// import Select from 'react-select';

var NewForm = React.createClass({
  propTypes: {
    title: React.PropTypes.string,
    isbn: React.PropTypes.string
  },
  getInitialState: function() {
    return {
      title: '',
      isbn: ''
    }
  },
  handleAdd: function(e) {
    e.preventDefault();
    var self = this;
    if (this.validForm()) {
      $.ajax({
        url: '/api/v1/books',
        method: 'POST',
        data: { book: self.state },
        success: function(data) {
          self.props.handleAdd(data);
          self.setState(self.getInitialState());
        },
        error: function(xhr, status, error) {
          alert('Cannot add a new record: ', error);
        }
      })
    } else {
      alert('Please fill all fields.');
    }
  },
  validForm: function() {
    if (this.state.title && this.state.isbn) {
      return true;
    } else {
      return false;
    }
  },
  handleChange: function(e) {
    var input_name = e.target.name;
    var value = e.target.value;
    this.setState({ [input_name] : value });
  },
  render: function() {
    return(
      <form className="form-inline" onSubmit={this.handleAdd}>
        <div className="form-group">
          <input type="text"
                 className="form-control"
                 name="title"
                 placeholder="Title"
                 ref="title"
                 value={this.state.title}
                 onChange={this.handleChange} />
        </div>
        <div className="form-group">
          <input type="text"
                 className="form-control"
                 name="isbn"
                 placeholder="ISBN"
                 ref="isbn"
                 value={this.state.isbn}
                 onChange={this.handleChange} />
        </div>
        <button type="submit" className="btn btn-primary">Dodaj</button>
      </form>
    )
  }
});
