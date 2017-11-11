import React from "react"
import PropTypes from "prop-types"
import Select from 'react-select';


const FLAVOURS = [
	{ label: 'Adam Mickiewicz', value: 'chocolate' },
	{ label: 'Ziemowit Szczerek', value: 'vanilla' },
	{ label: 'Andrzej Stasiuk', value: 'strawberry' },
	{ label: 'Marcin Świetlicki', value: 'caramel' },
	{ label: 'Kurt Vonnegut', value: 'cookiescream' },
	{ label: 'James Joyce', value: 'peppermint' },
];

const WHY_WOULD_YOU = [
	{ label: 'Chocolate (are you crazy?)', value: 'chocolate', disabled: true },
].concat(FLAVOURS.slice(1));

class SelectAuthor extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      authors: [],
      removeSelected: true,
      disabled: false,
      crazy: false,
      stayOpen: false,
      value: [],
      rtl: false
    };

    this.handleSelectChange = this.handleSelectChange.bind(this);
    this.handleKeyUp = this.handleKeyUp.bind(this);
    this.toggleCheckbox = this.toggleCheckbox.bind(this);
    this.toggleRtl = this.toggleRtl.bind(this);
    // this.handleSearch = this.handleSearchBook.bind(this);
  }
  componentDidMount() {}

  handleSelectChange(val) {

    // this.setState(prevState => ({
    //   value: [...prevState.value, val]
    // }))

    this.setState({ value: val });
    console.log('SelectChange');
  }

  handleKeyUp() {

    // this.setState({ value: val });
    console.log('KeyUp');
  }


  toggleCheckbox (e) {
  		this.setState({
  			[e.target.name]: e.target.checked,
  		});
  }

	toggleRtl (e) {
		let rtl = e.target.checked;
		this.setState({ rtl });
	}

  render() {
    const { crazy, disabled, stayOpen, value } = this.state;
    const options = FLAVOURS;
    return (


      <div className="row">
        <div className="col-md-2">
          Autor/Autorzy
        </div>
          <div className="col-md-10">
            <Select
          					closeOnSelect={!stayOpen}
          					disabled={disabled}
                    openOnClick={true}
          					multi
          					onChange={this.handleSelectChange}
                    onKeyUp={this.handleKeyUp}
          					// options={this.state.authors}
          					options={options}
          					placeholder="Zacznij wpisywać nazwisko autora"
                    removeSelected={this.state.removeSelected}
          					rtl={this.state.rtl}
          					simpleValue
          					value={value}
          	/>
            <div className="checkbox-list">
					<label className="checkbox">
						<input type="checkbox" className="checkbox-control" name="removeSelected" checked={this.state.removeSelected} onChange={this.toggleCheckbox} />
						<span className="checkbox-label">Remove selected options</span>
					</label>
					<label className="checkbox">
						<input type="checkbox" className="checkbox-control" name="disabled" checked={this.state.disabled} onChange={this.toggleCheckbox} />
						<span className="checkbox-label">Disable the control</span>
					</label>
					<label className="checkbox">
						<input type="checkbox" className="checkbox-control" name="crazy" checked={crazy} onChange={this.toggleCheckbox} />
						<span className="checkbox-label">I don't like Chocolate (disabled the option)</span>
					</label>
					<label className="checkbox">
						<input type="checkbox" className="checkbox-control" name="stayOpen" checked={stayOpen} onChange={this.toggleCheckbox}/>
						<span className="checkbox-label">Stay open when an Option is selected</span>
					</label>
					<label className="checkbox">
						<input type="checkbox" className="checkbox-control" name="rtl" checked={this.state.rtl} onChange={this.toggleCheckbox} />
						<span className="checkbox-label">rtl</span>
					</label>
				</div>
          </div>
      </div>
    )
  }
}

export default SelectAuthor
