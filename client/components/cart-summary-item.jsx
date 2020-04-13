import React from 'react';

export default class CartSummaryItem extends React.Component {

  render() {
    // console.log('this is the other side', this.props.cartObject);
    return (
    // <div>
    //   <div className="col-md-4">
    //     <img src={this.props.cartObject.image} className="card-img" alt="product-image"></img>
    //   </div>
    //   <div>{this.props.cartObject.name}</div>
    //   <div>{this.props.cartObject.price}</div>
    //   <div>{this.props.cartObject.shortDescription}</div>
    // </div>

      <div className="container col-11 detailPage ">
        <div className="row topRow">
          <div className="column col-5">
            <div className="col-12"><img className="size" src={this.props.cartObject.image} alt="" /></div>
          </div>
          <div className="column col-7">
            <div className="bottom font-weight-bold detailName">{this.props.cartObject.name}</div>
            <div className="bottom text-secondary">${(this.props.cartObject.price / 100).toFixed(2)}</div>
            <div >{this.props.cartObject.shortDescription}</div>
          </div>
        </div>
        {/* <div className="row bottomRow" >{this.state.product.longDescription}</div> */}
      </div >
    );
  }
}
