import React from "react"
import PropTypes from "prop-types"
import SelectAuthor from "components/books/SelectAuthor.js"

class NewBook extends React.Component {


  constructor(props) {
    super(props);

  }

  componentDidMount() {
  }



  render() {
    return(

      <div className="container">
          <SelectAuthor />
      </div>

    )
  }
}

export default NewBook
