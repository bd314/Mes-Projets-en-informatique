(function ($){
	var win = $('html,body'), header = $('#wrapper > header'), menu_links = $('#menu li').not('.site-logo');

	menu_links.each(function (){
		var target = $($(this).find('a').attr('href'));

		$(this).click(function (){
			menu_links.removeClass('active');
			$(this).addClass('active');
			target.find('> .wrap #dribbble-shots').css({'opacity':0, left:-100});

			win.stop().animate({scrollTop: target.offset().top}, 600, function (){
				target.find('> .wrap #dribbble-shots').animate({opacity: 1, left: 0}, 600, function (){
					$(this).css({'opacity':'', left:''});
				});
			});
			return false;
		});
	});

	$('.scroll-rounded').each(function (){
		var target = $($(this).attr('href'));

		$(this).click(function (){
			target.find('> .wrap #dribbble-shots').css({'opacity':0, left:-100});

			win.stop().animate({scrollTop: target.offset().top}, 600, function (){
				target.find('> .wrap #dribbble-shots').animate({opacity: 1, left: 0}, 600, function (){
					$(this).css({'opacity':'', left:''});
				});
			});
			return false;
		})
	});

	header.find('.site-title').css("top", (header.innerHeight()-header.find('.site-title').innerHeight())/2);

	header.find('.site-title').css({'opacity':0, top:'-=100'}).animate({opacity: 1, top: '+=100'}, 600, function (){
		$(this).css({'opacity':''});
	});
})(jQuery);