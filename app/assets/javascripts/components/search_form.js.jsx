var SearchForm = React.createClass({
  handleSearch: function() {
    var query = ReactDOM.findDOMNode(this.refs.query).value;
    var self = this;
    $.ajax({
      url: '/api/v1/books/search',
      data: { query: query },
      success: function(data) {
        self.props.handleSearch(query == '' ? [] : data);
      },
      error: function(xhr, status, error) {
        alert('Search error: ', status, xhr, error);
      }
    });
  },
  render: function() {
    return(
      <input onChange={this.handleSearch}
             type="text"
             className="form-control"
             placeholder="Wpisz frazę"
             ref="query" />
    )
  }
});
