jQuery ->
  $('a.js-fancyBoxGallery').fancybox()

$(".js-fancyBox").fancybox(
  prevEffect		: 'none'
  nextEffect		: 'none'
  helpers		:
    title	:
      type : 'inside'
    buttons	: {}
)

$('.js-fancyBoxGallery').click(() ->
  $('.js-fancyBox[rel="' + $(this).attr('rel') + '"]').eq(0).click();
  false
);