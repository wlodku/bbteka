import React from "react"
import PropTypes from "prop-types"
import Book from "components/books/Book.js"

class BookTable extends React.Component {

  componentDidMount() {
        console.log('Jest tabelka');
  }

  render() {
    const books = [];
    this.props.books.forEach(book => {
      books.push(<Book book={book} key={'book' + book.id}/>);
    });
    return(
      <table className="table table-striped table-hover">
        <thead>
          <tr>
            <th className="">Title</th>
            <th className="">ISBN</th>
            <th className="">Statut xD</th>
            <th className=""></th>
          </tr>
        </thead>
        <tbody>
          {books}
        </tbody>
      </table>
    )
  }
}

export default BookTable
