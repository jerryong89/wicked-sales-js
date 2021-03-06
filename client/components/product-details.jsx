import React from 'react';

export default class ProductDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      product: null
    };
  }

  componentDidMount() {
    this.getProduct();
  }

  componentDidUpdate() {
  }

  getProduct() {
    fetch(`/api/products/${this.props.productId}`)
      .then(res => res.json())
      .then(item => this.setState({
        product: item
      }));
  }

  render() {
    const product = this.state.product;
    if (!this.state.product) {
      return null;
    } else {
      return (
        <>
          <div className="container col-11 detailPage ">
            <div className="row topRow">
              <div className="column col-5">
                <div className="pointer text-secondary" onClick={() => this.props.changeItem('catalog')}>{'< Back to Catalog'}</div>
                <div className="col-12"><img className="size" src={this.state.product.image} alt="" /></div>
              </div>
              <div className="column col-7">
                <div className="bottom font-weight-bold detailName">{this.state.product.name}</div>
                <div className="bottom text-secondary">${(this.state.product.price / 100).toFixed(2)}</div>
                <div >{this.state.product.shortDescription}</div>
                <button type="button" className="topMargin btn btn-primary" onClick={() => this.props.addProduct(product)}>Add to Cart</button>
              </div>
            </div>
            <div className="row bottomRow" >{this.state.product.longDescription}</div>
          </div >
          <div className="climbingwallBottom2 col-12"><img className="climbingwall" src="images/wallpaper.svg" alt="" /></div>
        </>
      );
    }
  }
}
