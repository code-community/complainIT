import React, { Component } from 'react';
import './App.css';
import {Container,Alert} from 'reactstrap';
import Login from "./components/Login";


class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      loggedin: false
    }
  }
  render(){
    return (
      <div className="App">
        <Container style={{padding:20}}>
        {this.state.loggedin?<Alert color={'success'}>Logged in</Alert>:<Login/>}
        </Container>
        </div>
    );
  }
}

export default App;
