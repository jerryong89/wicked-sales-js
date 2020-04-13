import React from 'react';
import Header from './header';
import ProductList from './product-list';
import ProductDetails from './product-details';

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
    const label = this.state.view.name === 'catalog' ? <ProductList changeItem={this.setView} />
      : <ProductDetails changeItem={this.setView} productId={this.state.view.params} addProduct={this.addToCart} />;
    return (
      <div>
        <Header cartItemCount={this.state.cart} />
        {label}
      </div>
    );
  }
}
