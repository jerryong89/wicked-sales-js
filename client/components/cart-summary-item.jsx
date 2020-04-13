import React from 'react';

export default class CartSummaryItem extends React.Component {

  render() {
    // console.log('this is the other side', this.props.cartObject);
    return (
      <div>
        {/* {this.props.cartObject} */}
        <div className="col-md-4">
          <img src={this.props.cartObject.image} className="card-img" alt="product-image"></img>
        </div>
        <div>{this.props.cartObject.name}</div>
        <div>{this.props.cartObject.price}</div>
        <div>{this.props.cartObject.shortDescription}</div>
      </div>
    );
  }
}
