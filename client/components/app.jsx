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
  }

  componentDidMount() {
    this.getCartItems();
  }

  setView(name, params) {
    this.setState({
      view: { name, params }
    });
  }

  getCartItems() {
    fetch('/api/cart')
      .then(res => res.json())
      .then(item => this.setState({
        cart: item.length
      }));
  }

  render() {
    // const label = this.state.view.name === 'catalog' ? <ProductList changeItem={this.setView} />
    //   : <ProductDetails changeItem={this.setView} productId={this.state.view.params} />;
    return (
      <div>
        <Header cartItemCount={this.state.cart}/>
        <ProductDetails changeItem={this.setView} productId={this.state.view.params} />
        <ProductList changeItem={this.setView} />
      </div>
    );
  }
}
