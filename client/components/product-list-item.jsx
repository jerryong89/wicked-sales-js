import React from 'react';

export default function ProductListItem(props) {
  const product = props.item;
  return (
    <div onClick={() => props.changeItem('details', product.productId)} className="bottomM col-3">
      <div ><img className="size" src={product.image} /></div>
      <div className="bottom font-weight-bold">{product.name}</div>
      <div className="bottom text-secondary">${(product.price / 100).toFixed(2)}</div>
      <div className="bottom">{product.shortDescription}</div>
    </div>
  );
}
