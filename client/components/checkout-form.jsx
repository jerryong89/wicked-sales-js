import React from 'react';

export default class CheckoutForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: null,
      creditCard: null
    };
  }

  render() {
    return (
      <div className="container-fluid">
        <h1>Checkout</h1>
        {/* <div>{order.total}</div> */}
        <form>
          <div className="form-group">
            <label>Name</label>
            <input type="name" className="form-control"></input>
            <label>Credit Card</label>
            <input type="credit-card" className="form-control"></input>
            <label>Shipping Address</label>
            <input type="shipping-address" className="form-control"></input>
            <div onClick={() => this.props.changeItem('catalog', {})}> &lt; Continue Shopping</div><button className="btn btn-primary float-right">Place Order</button>
          </div>
        </form>
      </div>
    );
  }
}
