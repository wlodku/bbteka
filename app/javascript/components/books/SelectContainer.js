import React from "react"
import PropTypes from "prop-types"
import SelectAuthor from "components/books/SelectAuthor.js"



class SelectContainer extends React.Component {
  constructor(props) {
    super(props);
		this.state = {
			authors: []
		};

    this.handleKeyUp = this.handleKeyUp.bind(this);
  }
  componentDidMount() {}


  handleKeyUp() {
    console.log();
		this.setState(prevState => ({
		  authors: [...prevState.authors, { label: 'Adam Mickiewicz', value: String(Math.random()) }]
		}))
  }


  render() {

    return (
			<div onKeyUp={this.handleKeyUp}>
				<SelectAuthor authors={this.state.authors}/>
			</div>

    )
  }
}

export default SelectContainer
