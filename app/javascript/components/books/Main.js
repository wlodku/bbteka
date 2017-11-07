import React from "react"
import PropTypes from "prop-types"
import BookTable from "components/books/BookTable.js"

class Main extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      books: []
    };
  }

  componentDidMount() {
    fetch('/api/v1/books')
      .then(response => response.json())
      .then(json => {
        this.setState({books: json});
      });
  }


  render() {
    return (
      <div className="container">
        <div className="jumbotron">
          <h2>Wypożyczalnia xD</h2>
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
