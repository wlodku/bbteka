import React from "react"
import PropTypes from "prop-types"
import Select from 'react-select'
import fetch from 'isomorphic-fetch'

import '!style-loader!css-loader!react-select/dist/react-select.css';

class SelectAuthor extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      value: []
    };

    this.handleSelectChange = this.handleSelectChange.bind(this);
    // this.handleInputChange = this.handleInputChange.bind(this);
    this.getOptions = this.getOptions.bind(this);
  }

  componentDidMount() {

  }

  handleSelectChange(val) {
    this.setState({ value: val });
    console.log(val);
  }


  getOptions(input) {
		if (input.length < 3) {
			return Promise.resolve({ options: [] });
		}

		return fetch(`/api/v1/authors/search/${input}`)
		.then((response) => response.json())
		.then((json) => {
			return { options: json };
		});
	}

  render() {

    return (

      <div className="row">
        <div className="col-md-2">
          Autor/Autorzy
        </div>
          <div className="col-md-10">
              <Select.Async
                name="selectAuthors"
                multi={true}
                value={this.state.value}
                onChange={this.handleSelectChange}
                loadOptions={this.getOptions}
                closeOnSelect={false}
                onSelectResetsInput={false}
                backspaceRemoves={false}
                ignoreCase={true}
                isOptionUnique={true}
                removeSelected={true}
                placeholder="Zacznij wpisywać nazwisko/imię autora"
               />

          </div>
      </div>
    )
  }
}

export default SelectAuthor
