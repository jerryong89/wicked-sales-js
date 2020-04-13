import React from 'react';

export default class Header extends React.Component {

  render() {
    return (
      <div className="row">
        <h3 className="header col-6">$ Wicked Sales</h3>
        <div className="header col-6"><div className="cart">0 Items &nbsp;<i /* onClick={()=>this.props.cartItems.length} */ className="fas fa-shopping-cart cart"></i></div></div>
      </div>
    );
  }
}
