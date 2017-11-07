import React from "react"
import PropTypes from "prop-types"
class Book extends React.Component {

  componentDidMount() {
        console.log('Jest ksionszka');
  }

  render() {
    let book = this.props.book;
    return(
      <tr>
        <td>{book.title}</td>
        <td>{book.isbn}</td>
        <td>Wypożyczona</td>
        <td>Rezerwuj</td>
      </tr>
    )
  }
}
Book.propTypes = {
  title: PropTypes.string,
  isbn: PropTypes.string
};

export default Book
