import React from "react"
import PropTypes from "prop-types"
import SelectAuthor from "components/books/SelectAuthor.js"

class NewBook extends React.Component {


  constructor(props) {
    super(props);

    this.handleSearchAuthor = this.handleSearchAuthor.bind(this);
    this.handleSearchBook = this.handleSearchBook.bind(this);
  }
  componentDidMount() {

  }

  handleSearchAuthor() {
    setTimeout(()=>{
      // let query = (this.refs.query).value;
      // let url = '/api/v1/books/search?query='+query;
      //
      // fetch(url)
      //   .then(response => response.json())
      //   .then(json => {
      //     this.props.handleSearch(query == '' ? [] : json);
      //     console.log(json);
      //   });

    }, 500);
  }

  handleSearchBook() {
    setTimeout(()=>{

    }, 500);
  }

  render() {
    return(
      // <div>
      // "Autor/Autorzy"
      // <input onChange={this.handleSearchAuthor}
      //        type="text"
      //        className="form-control"
      //        placeholder="Wpisz frazę"
      //        ref="author" />
      // <input onChange={this.handleSearchBook}
      //       type="text"
      //       className="form-control"
      //       placeholder="Wpisz frazę"
      //       ref="book" />
      // </div>

      <div className="container">
          <SelectAuthor />

          {/* <div className="col-md-10">
            <input onChange={this.handleSearchAuthor}
                    type="text"
                    className="form-control"
                    placeholder="Wpisz frazę"
                    ref="author" />
          </div> */}
      </div>

        /* <div className="row">
          <div className="col-md-12">
            <BookTable books={this.state.books}/>
          </div>
        </div>
      </div> */
    )
  }
}

export default NewBook
