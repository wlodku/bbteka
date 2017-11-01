// import Select from 'react-select';

var Main = React.createClass({
  getInitialState: function() {
    return { books: [] };
  },
  componentDidMount: function() {
    // this.getDataFromApi();
    //  $.getJSON('/api/v1/books', (response) => { this.setState({ books: response }) });
     return { books: [] };

  },
  getDataFromApi: function() {
    var self = this;
    $.ajax({
      url: '/api/v1/books',
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
  handleAdd: function(book) {
    var books = this.state.books;
    books.push(book);
    this.setState({ books: books });
  },
  render: function() {
    return(
      <div className="container">
        <div className="jumbotron">
          <h2>Wypożyczalnia xD</h2>
        </div>
        <div className="row">
          <div className="col-md-4">
            <SearchForm handleSearch={this.handleSearch} />
          </div>
          <div className="col-md-8">
            <NewForm handleAdd={this.handleAdd} />
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
