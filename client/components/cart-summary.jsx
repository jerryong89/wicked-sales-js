import React from 'react';
import CartSummaryItem from './cart-summary-item';

export default class CartSummary extends React.Component {
  render() {
    const cartTotal = this.props.items.reduce((cur, acc) => cur + acc.price, 0).toFixed(2) / 100;
    const cartItem = this.props.items;
    let itemsInCart;
    let checkOutButton;
    if (cartItem.length === 0) {
      itemsInCart = <h1>No Items In Cart</h1>;
      checkOutButton = <div></div>;
    } else {
      itemsInCart = <h1>My Cart</h1>;
      checkOutButton = <button className="btn btn-primary float-right lastRow" onClick={() => this.props.changeItem('checkout', {})}>Check Out</button>;
    }
    return (
      <>
        <div className="container">
          <div className="text-secondary pointer" onClick={() => this.props.changeItem('catalog', {})}>{'< Back to Catalog'}</div>
          {itemsInCart}
          {cartItem.map(item => { return <CartSummaryItem key={item.cartItemId} cartObject={item} />; })}
          <div className="cartB"></div>
          <div>
            <div>Item Total: ${cartTotal}</div>
            {checkOutButton}
          </div>
          <div className="cartSummaryB"></div>
        </div>
        <div className="climbingwallBottom2 col-12"><img className="climbingwall" src="images/wallpaper.svg" alt="" /></div>
      </>
    );
  }
}
