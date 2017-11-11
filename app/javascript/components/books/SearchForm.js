import React from "react"
import PropTypes from "prop-types"

class SearchForm extends React.Component {


  constructor(props) {
    super(props);

    this.handleSearch = this.handleSearch.bind(this);
  }
  componentDidMount() {

  }

  handleSearch() {
    setTimeout(()=>{
      let query = (this.refs.query).value;
      let url = '/api/v1/books/search?query='+query;

      fetch(url)
        .then(response => response.json())
        .then(json => {
          this.props.handleSearch(query == '' ? [] : json);
          console.log(json);
        });
    }, 500);
  }

  render() {
    return(
      <input onChange={this.handleSearch}
             type="text"
             className="form-control"
             placeholder="Wpisz frazę"
             ref="query" />
    )
  }
}

export default SearchForm
