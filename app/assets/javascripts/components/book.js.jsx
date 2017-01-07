var Book = React.createClass({
  propTypes: {
    title: React.PropTypes.string,
    isbn: React.PropTypes.string
  },
  render: function() {
    var book = this.props.book;
    return(
      <tr>
        <td>{book.title}</td>
        <td>{book.isbn}</td>        
      </tr>
    )
  }
});
