$(document).on('turbolinks:load', function(){
    $('.rating').raty({path: '/assets'});
});

var refreshRating = function() {
  $('.rating').raty({path: '/assets', scoreName: 'comment[rating]'});
  $('.rated').raty({path: '/assets',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
};

$(document).on('turbolinks:load ajaxSuccess', function(){
  refreshRating();

  $('.img-zoom').elevateZoom({
    zoomType : "lens",
    lensShape : "round",
    lensSize : 200
  });
});


  $('#notice').delay(2000).fadeOut(1500);

  $('.alert').delay(2000).fadeOut(1500);
