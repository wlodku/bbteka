import React from "react"
import PropTypes from "prop-types"
import Select from 'react-select'
// import axios from 'axios';


class SelectAuthor extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      value: [],
      options: []
    };

    this.handleSelectChange = this.handleSelectChange.bind(this);
    this.getOptions = this.getOptions.bind(this);
  }

  componentDidMount() {
    // fetch('/api/v1/authors/search/')
    //   .then((response) => {
    //     return response.json();
    //   }).then((json) => {
    //     console.log('Mam jsona: '+json);
    //     this.setState({authors: json});
    //   });
  }

  handleSelectChange(val) {
    this.setState({ value: val });
    console.log('SelectChange: '+val);
  }



  getOptions(query) {      
    return fetch('/api/v1/authors/search/')
      .then((response) => {
        return response.json();
      }).then((json) => {
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
            					closeOnSelect={false}
                      onSelectResetsInput={false}
                      backspaceRemoves={false}
                      ignoreCase={true}
            					multi
            					onChange={this.handleSelectChange}
                      isOptionUnique={true}
                      // onInputChange={this.handleInputChange}
                      isLoading={this.state.isLoading}
            					// options={this.state.authors}
                      loadOptions={this.getOptions}
            					placeholder="Zacznij wpisywać nazwisko/imię autora"
                      removeSelected={true}
            					simpleValue={true}
            					value={this.state.value}
            	/>
          </div>
      </div>
    )
  }
}

export default SelectAuthor
