import React from "react"
import PropTypes from "prop-types"
import BookTable from "components/books/BookTable.js"
import SearchForm from "components/books/SearchForm.js"

class Main extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      books: []
    };

    this.handleSearch = this.handleSearch.bind(this);
  }

  componentDidMount() {
    fetch('/api/v1/books')
      .then(response => response.json())
      .then(json => {
        this.setState({books: json});
      });
  }

  handleSearch(books) {
    this.setState({ books: books });
  }

  render() {
    return (
      <div className="container">
        <div className="jumbotron">
          <h2>Wypożyczalnia xD</h2>
          <div className="col-md-4">
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
}

export default Main
