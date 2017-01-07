var BookApplication = React.createClass({
  render: function() {
    return(
      <div className="container">
        <div className="jumbotron">
          <h1>BBteka</h1>
        </div>
        <div className="row">
          <div className="col-md-12">
            <BookTable />
          </div>
        </div>
      </div>
    )
  }
});
