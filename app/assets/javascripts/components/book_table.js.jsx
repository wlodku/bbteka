var BookTable = React.createClass({
  render: function() {
    return(
      <table className="table table-striped">
        <thead>
          <tr>
            <th className="col-md-6">Title</th>
            <th className="col-md-6">ISBN</th>            
          </tr>
        </thead>
        <tbody></tbody>
      </table>
    )
  }
});
