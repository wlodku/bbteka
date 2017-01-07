var BookApplication = React.createClass({
  getInitialState: function() {
    return { books: [] };
  },
  componentDidMount: function() {
    this.getDataFromApi();
  },
  getDataFromApi: function() {
    var self = this;
    $.ajax({
      url: '/api/books',
      success: function(data) {
        self.setState({ books: data });
      },
      error: function(xhr, status, error) {
        alert('Cannot get data from API: ', error);
      }
    });
  },
  handleSearch: function(books) {
    this.setState({ books: books });
  },
  render: function() {
    return(
      <div className="container">
        <div className="jumbotron">
          <h1>BBteka</h1>
        </div>
        <div className="row">
          <div className="col-md-12">
            <SearchForm handleSearch={this.handleSearch} />
          </div>
        </div>
        <div className="row">
          <div className="col-md-12">
            <BookTable books={this.state.books}/>
          </div>
        </div>
      </div>
    )
  }
});
