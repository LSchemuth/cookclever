import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('pages_supermarket_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};
const reconfigurableOptions = {
  language: 'de'
};
export { initAutocomplete };
