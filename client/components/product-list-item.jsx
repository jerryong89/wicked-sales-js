import React from 'react';

function ProductListItem(props) {
  const product = props.item;
  return (
    <div className="bottomM col-3">
      <div >
        <div ><img className="size" src={product.image} alt=""/></div>
        <div className="bottom bold">{product.name}</div>
        <div className="bottom price">${(product.price / 100).toFixed(2)}</div>
        <div >{product.shortDescription}</div>
      </div >
    </div>
  );
}
export default ProductListItem;
