import React from 'react';
import CartSummaryItem from './cart-summary-item';

export default class CartSummary extends React.Component {
  render() {
    const cartItem = this.props.items;
    let itemsInCart;
    if (cartItem.length === 0) {
      itemsInCart = <h1>No Items In Cart</h1>;
    } else {
      itemsInCart = <h1>My Cart</h1>;
    }
    return (
      <div className="container">
        <div className="col-2 text-secondary" onClick={() => this.props.changeItem('catalog', {})}>{'< Back to Catalog'}</div>
        {itemsInCart}
        {cartItem.map(item => { return <CartSummaryItem key={item.cartItemId} cartObject={item} />; })}
      </div>
    );
  }
}
