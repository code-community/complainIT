import React, { Component } from 'react';
import '../App.css';
import '../sources/css/main.css'
import {Container,Alert} from 'reactstrap';

class Login extends Component {
    constructor(props){
        super(props);
        this.state = {
            loggedin: false
        }
    }
    render(){
        return (
            <div className="limiter">
                <div className="container-login100">
                    <div className="wrap-login100">

                        <form className="login100-form validate-form" action="#">
					<span className="login100-form-title">
						<div className="login-icon">
							<img src={require("./logo.jpg")} alt="This is the logo" id="logo-image"/>
						</div>
						Please Login Here
					</span>

                            <div className="wrap-input100 validate-input">
                                <input className="input100" type="text" name="email" id="email" placeholder="Email"/>
                                    <span className="symbol-input100">
							<i className="fa fa-envelope" aria-hidden="true"/>
						</span>
                            </div>

                            <div className="wrap-input100 validate-input">
                                <input className="input100" type="password" name="pass" id="pass"
                                       placeholder="Password"/>
                                    <span className="focus-input100"/>
                                    <span className="symbol-input100">
							<i className="fa fa-lock" aria-hidden="true"/>
						</span>
                            </div>
                            <div className="form-check checkbox">
                                <input type="checkbox" className="form-check-input" id="login-remember"/>
                                    <label className="form-check-label" htmlFor="login-remember">Remember me</label>
                            </div>
                            <div className="container-login100-form-btn">
                                <button className="login100-form-btn">
                                    Login
                                </button>
                            </div>

                            <div className="text-center p-t-12">
                                <a className="txt2" href="#">
                                    Forgot Username / Password?
                                </a>
                                <div className="text-center p-t-13">
                                    <a className="txt2" href="signup.html">
                                        Create your Account
                                        <i className="fa fa-long-arrow-right m-l-5" aria-hidden="true"/>
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        );
    }
}

export default Login;
