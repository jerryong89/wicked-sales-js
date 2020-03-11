import React from 'react';
import ProductListItem from './product-list-item';

class ProductList extends React.Component {
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
      <div className="container col-12">
        <div className="row col-12 row d-flex justify-content-center">
          {this.state.products.map(product => < ProductListItem key={product.productId} item={product}/>)}
        </div>
      </div>
    );
  }
}
export default ProductList;
