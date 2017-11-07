import Select from 'react-select';

// import 'react-select/dist/react-select.css';
// var SelectB = require('react-select');

var options = [
  { value: 'one', label: 'One' },
  { value: 'two', label: 'Two' }
];

function logChange(val) {
  console.log("Selected: qwe " + val);
}

<Select
  name="form-field-name"
  value="one"
  options={options}
  onChange={logChange}
/>
