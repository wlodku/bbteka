// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Select from 'react-select';


// var Select = require('react-select');


function logChange(val) {
  console.log('Selected: ', val);
}


const Hello = props => (
  <Select
  name="form-field-name"
  value={"one"}
  multi={true}
  options={props.qwe}
  onChange={logChange}
/>
)

Hello.defaultProps = {
  name: 'frontend..',
  qwe: [
    { value: 'one', label: 'One' },
    { value: 'two', label: 'Two' },
    { value: 'qwe', label: 'Three' },
    { value: 'asd', label: 'Four' }
  ]
}

Hello.propTypes = {
  name: PropTypes.string
}

document.addEventListener('DOMContentLoaded', () => {
  var options = [
    { value: 'one', label: 'One' },
    { value: 'two', label: 'Two' }
  ];

  function logChange(val) {
    console.log('Selected: ', val);
  }
  ReactDOM.render(

    <Hello />,
    document.body.appendChild(document.createElement('div')),
  )
})
