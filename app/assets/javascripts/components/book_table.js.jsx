var BookTable = React.createClass({
  render: function() {
    var books = [];
    this.props.books.forEach(function(book) {
     books.push(<Book book={book}
                        key={'book' + book.id}/>);
   }.bind(this));
    return(
      <table className="table table-striped table-hover">
        <thead>
          <tr>
            <th className="col-md-6">Title</th>
            <th className="col-md-6">ISBN</th>
          </tr>
        </thead>
        <tbody>
          {books}
        </tbody>
      </table>
    )
  }
});
