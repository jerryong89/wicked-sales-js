import React from 'react';

export default class CheckoutForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: null,
      creditCard: null,
      shippingAddress: null
    };
    this.handleNameChange = this.handleNameChange.bind(this);
    this.handleCreditCard = this.handleCreditCard.bind(this);
    this.handleShipping = this.handleShipping.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleNameChange(event) {
    this.setState({
      name: event.target.value
    });
  }

  handleCreditCard(event) {
    this.setState({
      creditCard: event.target.value
    });
  }

  handleShipping(event) {
    this.setState({
      shippingAddress: event.target.value
    });
  }

  handleSubmit(event) {
    this.props.placeOrder(this.state);
  }

  render() {
    const cartTotal = this.props.items.reduce((cur, acc) => cur + acc.price, 0).toFixed(2) / 100;
    return (
      <div className="container">
        <h1>Checkout</h1>
        <div className="cartB"></div>
        <div className="text-secondary">Order Total: ${cartTotal}</div>
        <div className="cartB"></div>
        <form>
          <div className="form-group">
            <label>Name</label>
            <input type="name" className="form-control" onChange={this.handleNameChange}></input>
            <label>Credit Card</label>
            <input type="credit-card" className="form-control" onChange={this.handleCreditCard}></input>
            <label>Shipping Address</label>
            <input type="shipping-address" className="form-control" onChange={this.handleShipping}></input>
            <div className="cartB"></div>
            <div className="pointer text-secondary" onClick={() => this.props.changeItem('catalog', {})}>{'< Continue Shopping'}</div><button onClick={() => this.handleSubmit() } className="btn btn-primary float-right lastRow">Place Order</button>
          </div>
        </form>
      </div>
    );
  }
}
