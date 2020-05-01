import React from 'react';
import ProductListItem from './product-list-item';

export default class ProductList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      products: []
    };
  }

  componentDidMount() {
    this.getProducts();
  }

  getProducts() {
    fetch('/api/products')
      .then(res => res.json())
      .then(items => this.setState({
        products: items
      }));
  }

  render() {
    return (
      <>
        <div className="climbingwall col-12"><img className="climbingwall" src="images/wallpaper.svg" alt=""/></div>
        <div className="container">
          <div className="sales col-12 row d-flex justify-content-center">
            {this.state.products.map(product => < ProductListItem key={product.productId} changeItem={this.props.changeItem} item={product} />)}
          </div>
        </div>
        <div className="climbingwallBottom col-12"><img className="climbingwall" src="images/wallpaper.svg" alt="" /></div>
      </>
    );
  }
}
