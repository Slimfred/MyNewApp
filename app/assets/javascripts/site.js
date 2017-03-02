$(document).on('turbolinks:load', function(){
    $('.rating').raty({path: '/assets'});
});

$(document).on('turbolinks:load', function(){
  $('.rating').raty({path: '/assets', scoreName: 'comment[rating]'});
  $('.rated').raty({path: '/assets',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });

  $('#notice').delay(2000).fadeOut(1500);

  $('.alert').delay(2000).fadeOut(1500);

});
