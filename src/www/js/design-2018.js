// -----------------------------------------------------------------------------
// NAV BAR
// -----------------------------------------------------------------------------
function NavBar() {}

NavBar.prototype.bind = function () {
    $("#navbar").click(function () {
		$(this).toggleClass('navbar--opened');
		$(".primary-menu").slideToggle(200);
	});

	$('.arrow-down').parent().click(function() {
		var arrow = $(this);
		var body = $("html, body");
		if(window.pageYOffset + 50 < arrow.offset().top) {
			body.animate({scrollTop: arrow.offset().top - 50}, 500);
		}
	});
};

// -----------------------------------------------------------------------------
// COOKIE BAR
// -----------------------------------------------------------------------------
function CookieBar() {}

CookieBar.prototype.bind = function () {
    //general cookie setting
    var date = new Date();
    date.setTime(date.getTime() + 30 *24*60*60*1000) ;
    var cookieSettings = {
        domain: '',
        path: '',
        expiresAt: date,
        secure: false
    };

    if(!$.cookies.get('accepted-cookie')){
        $('.cookie-bar').removeClass('cookie-bar--disabled');
    }

    $('.cookie-bar .cookie-bar__btn-ok').click(function () {
        $('.cookie-bar').addClass('cookie-bar--disabled');
        $.cookies.set('accepted-cookie', 1,cookieSettings);
        return false;
    });
};

// -----------------------------------------------------------------------------
// LEAD FORM
// -----------------------------------------------------------------------------
function LeadForm() {}

LeadForm.prototype.bind = function () {
    $('.lead form').submit(function(e) {
		$(this).find('.lazy-value').each(function(i, item) {
			var attrName = $(item).data('to-hidden');
			$('input[name='+attrName+']').val($(item).val());
		});
	});

	$('.lead .list').each(function () {
        var lang = $(this).attr('data-lang');
        var data =  JSON.parse($(this).attr('data-values').toString());
        var actualKey = "";

        for(var key in data) {
            if(data.hasOwnProperty(key)) {
                $(this).html(data[key][lang]);
                actualKey = key;
                break;
            }
        }

        var name = $(this).attr('data-to-hidden');
        $('.lead form input[name='+name+']').val(key);

        var next = false;
        $(this).click(function () {
            for(var key in data) {
                if(data.hasOwnProperty(key)) {
                    if(next){
                        $(this).html(data[key][lang]);
                        actualKey = key;
                        next = false;
                        break;
                    }

                    if(key == actualKey)
                        next = true;
                }
            }

            if(next){
                for(var key in data) {
                    if(data.hasOwnProperty(key)) {
                        $(this).html(data[key][lang]);
                        actualKey = key;
                        break;
                    }
                }
            }

            next = false;
            var name = $(this).attr('data-to-hidden');
            $('.lead form input[name='+name+']').val(key);
        });
    });
};

// -----------------------------------------------------------------------------
// EVENT LISTENER
// -----------------------------------------------------------------------------
function EventListener(window) {
	this.window = window;
	this.listeners = [];
}

EventListener.prototype.add = function (listener, event) {
	this.listeners.push({type: event, callback: listener});
};

EventListener.prototype.bind = function () {
	var self = this;
	self.run();

	$(self.window).resize(self.onResize.bind(this));
	$(self.window).scroll(self.onScroll.bind(this));
};

EventListener.prototype.onResize = function () {
	this.listeners.forEach(function(i) {
		if(i.type == 'resize') {
			i.callback.run();
		}
	});
};

EventListener.prototype.onScroll = function () {
	this.listeners.forEach(function(i) {
		if(i.type == 'scroll') {
			i.callback.run();
		}
	});
};

EventListener.prototype.run = function () {
	this.listeners.forEach(function(i) {
		i.callback.run();
	});
};

// -----------------------------------------------------------------------------
// PORTFOLIO
// -----------------------------------------------------------------------------
function Portfolio() {}

Portfolio.prototype.run = function () {
	var self = this;
	var win = $(window);

	var viewport = {
		top : win.scrollTop()
	};
	viewport.bottom = viewport.top + win.height();

	$('.article').each(function () {
		var bounds = $(this).offset();
		if(viewport.bottom > bounds.top /*&& $(this).css('display') != 'none'*/){
			self.load($(this));
		}
	});
}

Portfolio.prototype.load = function (thisVisible) {
	var srcImageNews;
	thisVisible.find('.article__thumbnail img').each(function () {
		if(typeof $(this).attr('src') === 'undefined' || $(this).attr('src') == ""){
			srcImageNews = $(this).attr('data-src');
			$(this).attr('src', srcImageNews);
		}
	});
	thisVisible.animate({opacity: 1}, 250);
};

// -----------------------------------------------------------------------------
// CASE STUDY LOADER
// -----------------------------------------------------------------------------
function CaseStudyLoader() {}

CaseStudyLoader.prototype.run = function () {
	var offsetTopLoader = 0;
	var loaderEl = $('.cs-loader');
	if(loaderEl.length){
		var percentEl = loaderEl.find('.percent');
		var overlayEl = loaderEl.find('.overlay');
		var loaderTop = loaderEl.offset().top + offsetTopLoader;
		var loaderHeight = loaderEl.height() - offsetTopLoader;
		var scrollTop = $(window).scrollTop() + loaderHeight;
		var percentVal = 0;

		if(loaderTop<scrollTop){
			percentVal = ((scrollTop - loaderTop) / (loaderHeight/100));
			overlayEl.width(100-percentVal+"%");
			percentVal = percentVal.toFixed(0);
			percentEl.text(percentVal);
			if(percentVal>=100){
				overlayEl.width(0);
				percentEl.text(100);
				window.location.href = loaderEl.attr('data-next-page');
			}
		}else{
			overlayEl.width('100%');
			percentEl.text(0);
		}
	}
};

// -----------------------------------------------------------------------------
// CASE STUDY PARALLAX
// -----------------------------------------------------------------------------
function CaseStudyParallax() {}

CaseStudyParallax.prototype.run = function () {
	var speed = 0.3;
    var offset = $(window).height()*0.7;
    $('.parallax__website').each(function () {
        var thisTop = $(this).offset().top - offset;
        var scrollTop = $(window).scrollTop();

        if(thisTop<scrollTop){
            $(this).css("background-position", "center -"+(scrollTop-thisTop)*speed+"px");
        }else{
            $(this).css("background-position", "center 0px");
        }
    });
};

// -----------------------------------------------------------------------------
// PROTEIN LOGO
// -----------------------------------------------------------------------------
function ProteinLogo() {
	this.position = false;
}

ProteinLogo.prototype.run = function () {
	var self = this;
	var top = $(window).scrollTop();

	if(self.position) {
		if(self.position > top) {
			setTimeout(function () {
                $('.header__main-logo').fadeIn(400);
            }, 700);

            //$('.header__main-logo').fadeIn(400);
		} else {
			$('.header__main-logo').fadeOut(200);
		}
	}

	self.position = top;
};

// -----------------------------------------------------------------------------
// FONT REM MANAGER
// -----------------------------------------------------------------------------
function FontRemManager() {}

FontRemManager.prototype.run = function () {
	var windowW = $(window).width();
	var size;

	if(windowW > 1300) {
		size = windowW/1905*16;
	} else {
		size =1300/1905*16;
	}

	$('html').css('font-size', +size+'px');
};

// -----------------------------------------------------------------------------
// MAIN
// -----------------------------------------------------------------------------
$(function() {
	var navBar = new NavBar();
	navBar.bind();

	var cookieBar = new CookieBar();
	cookieBar.bind();

	var leadForm = new LeadForm();
	leadForm.bind();

	var listener = new EventListener(window);
	listener.add(new Portfolio(), 'scroll');
	listener.add(new CaseStudyLoader(), 'scroll');
	listener.add(new CaseStudyParallax(), 'scroll');
	listener.add(new ProteinLogo(), 'scroll');
	listener.add(new FontRemManager(), 'resize');
	listener.bind();
});
