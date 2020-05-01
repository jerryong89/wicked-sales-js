import React from 'react';

export default class Header extends React.Component {
  render() {
    return (
      <div className="rowmod">
        <h3 className="header col-6">Send It Sales</h3>
        <div className="header col-6" onClick={() => this.props.changeItem('cart')}> <div className="pointer cart">{this.props.cartItemCount.length} Items &nbsp;<i className="pointer fas fa-shopping-cart cart"></i></div></div>
      </div>
    );
  }
}
