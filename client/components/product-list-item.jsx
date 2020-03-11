import React from 'react';

function ProductListItem(props) {
  return props.items.map(products => {
    return (
      <div key={products.id} className="bottomM col-3">
        <div key={products.id}>
          <div ><img className="size" src={products.image} alt=""/></div>
          <div className="bottom bold">{products.name}</div>
          <div className="bottom price">${products.price / 100}</div>
          <div >{products.shortDescription}</div>
        </div >
      </div>
    );
  });
}
export default ProductListItem;
