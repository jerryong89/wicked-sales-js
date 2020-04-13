import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';
import CartSummary from './cart-summary';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: { name: 'catalog', params: {} },
      cart: []
    };
    this.setView = this.setView.bind(this);
    this.getCartItems = this.getCartItems.bind(this);
    this.addToCart = this.addToCart.bind(this);
  }

  setView(name, params) {
    this.setState({
      view: { name, params }
    });
  }

  getCartItems() {
    fetch('/api/cart')
      .then(res => res.json())
      .then(data => this.setState({
        cart: data
      }));
  }

  addToCart(product) {
    const Id = product.productId;
    fetch(`/api/cart/${Id}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(product)
    })
      .then(res => {
        return res.json();
      })
      .then(data => {
        this.setState({
          cart: this.state.cart.concat(data)
        });
      })
      .catch(err => console.error(err));
  }

  componentDidMount() {
    this.getCartItems();
  }

  render() {
    let conditionalRender;
    if (this.state.view.name === 'details') {
      conditionalRender = <ProductDetails changeItem={this.setView} productId={this.state.view.params} addProduct={this.addToCart} />;
    } else if (this.state.view.name === 'catalog') {
      conditionalRender = <ProductList changeItem={this.setView} />;
    } else if (this.state.view.name === 'cart') {
      conditionalRender = <CartSummary changeItem={this.setView} productId={this.state.view.params} items={this.state.cart} />;
    }
    return (
      <div>
        <Header changeItem={this.setView} cartItemCount={this.state.cart} />
        {conditionalRender}
      </div>
    );
  }
}
