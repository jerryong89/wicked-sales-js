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
      // console.log('this is item', cartItem),
      <div>
        <button onClick={() => this.props.changeItem('catalog', {})}>&lt; Back to Catalog</button>
        {itemsInCart}
        {cartItem.map(item => { return <CartSummaryItem key={item.cartItemId} cartObject={item} />; })}
      </div>
    );
  }
}
