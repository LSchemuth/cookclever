
const counter = () => {
  const count = document.querySelector('.count')
  if(count){
    console.log('counting')
    $('.count').each(function () {
      $(this).prop('Counter',0).animate({
          Counter: $(this).text()
      }, {
          duration: 4000,
          easing: 'swing',
          step: function (now) {
              $(this).text(Math.ceil(now));
          }
      });
    });
  }
}

export { counter }
