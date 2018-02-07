$(document).ready(function() {
    var rowNumOld = 0;
    $('.portfolio .box > div > img').click(function () {

        var id = $(this).parents('.box').attr('data-id');
        var infoBox = $(this).parents('.box').find('.info');
        var thisEl = $(this).parents('.box');
        var headerEl = $("#header");
        var topHeader = headerEl.height() + (parseInt(headerEl.css("top"))*2)||0;

        if(infoBox.attr('data-ajax-loaded') == undefined){
            infoBox.html('<div class="row"><span class="ajax-loader"></span></div>');
            $.ajax({
                url: "/"+$('html').attr('lang')+"/get-detail/"+id,
                success: function( data ) {
                    infoBox.html(data);
                    infoBox.attr('data-ajax-loaded', 'true');

                    thisEl.find('.big-image').attr('src', thisEl.find('.show-big[data-id="'+id+'"]').attr('src'));
                    thisEl.find('.text-slide').hide();
                    thisEl.find('.text-slide[data-id="'+id+'"]').show();

                    thisEl.find('.close').on('click', function () {
                        var thisEl = $(this).parents('.box');
                        thisEl.addClass('animate-me').removeClass('opened');
                        setTimeout(function () {
                            thisEl.removeClass('animate-me')
                        },100);
                        rowNumOld = 0;
                    });

                    thisEl.find('.show-big').click(function () {
                        var id = $(this).attr('data-id');
                        thisEl.find('.big-image').attr('src', $(this).attr('src'));
                        thisEl.find('.text-slide').hide();
                        thisEl.find('.text-slide[data-id="'+id+'"]').show();
                    });
                }
            });
        }else{
            thisEl.find('.big-image').attr('src', thisEl.find('.show-big[data-id="'+id+'"]').attr('src'));
            thisEl.find('.text-slide').hide();
            thisEl.find('.text-slide[data-id="'+id+'"]').show();
        }

        var thisBox = $(this).parent().parent();
        var openedBox = '.portfolio .box.opened';
        var animateClass = '';
        var hasClass = thisBox.hasClass('opened');
        var isSmtOpened =  $(openedBox).length;
        var rowNum = thisBox.prevAll().andSelf().filter('.firstInRow').length;
        //$(this).parents('.box').find('.text').html(getPortfolioTexts(id));
        $(this).parents('.box').find('.big-image').attr('src', $(this).parents('.box').find('.big-image').attr('data-src'));


        if(rowNum != rowNumOld){
            animateClass = ' animate-me';
            rowNumOld = rowNum;
        }

        var openedBoxEl = $('.portfolio .box.opened');

        if(!hasClass){
            var srcImageNews;
            thisBox.find('img').each(function () {
                if($(this).attr('src') == ""){
                    srcImageNews = $(this).attr('data-src');
                    $(this).attr('src', srcImageNews);
                }
            });

            if(!isSmtOpened || animateClass == ''){
                thisBox.addClass('opened'+animateClass);
            }else{
                var thisEl = thisBox;
                setTimeout(function () {
                    thisEl.addClass('opened'+animateClass);
                },100);
            }
        }else{
            rowNumOld = 0;
        }

        if(animateClass == '' && !hasClass){
            openedBoxEl.removeClass('opened').removeClass('animate-me');
        }else{
            openedBoxEl.addClass('animate-me').removeClass('opened');
            setTimeout(function () {
                openedBoxEl.removeClass('animate-me')
            },100);
        }
        setTimeout(function () {
            $.scrollTo( thisEl, 900,  {offset: {top:-topHeader+thisEl.height(), left:0} });
        }, 110);
    });

    /*$('.portfolio .filter span').click(function () {
        $(this).parent().find('span').removeClass('active');
        if($(this).parent().hasClass("type")){
            $('.filter-top-text-toggle > div').hide();
            $('.filter-top-text-toggle > div[data-type="'+$(this).attr("data-filter")+'"]').show();
        }
        $(this).addClass('active');

        return false;
    });*/

    $('.nav-toggle').click(function () {
        $('.responsive-toggle').slideToggle();
    });

    $('.scroll-to').click(function () {
        var headerEl = $("#header");
        var topHeader = headerEl.height() + (parseInt(headerEl.css("top"))*2)||0;
        var href = $(this).attr('href');

        $.scrollTo( href, 1500,  {offset: {top:-topHeader, left:0} });
        return false;
    });

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
        $('.cookies').show();
    }

    $('.cookies .btn').click(function () {
        $('.cookies').hide();
        $.cookies.set('accepted-cookie', 1,cookieSettings);
        return false;
    });

    $('#lead-slider-responsive').selectpicker();


    $("#lead-slider").slider({
        min: 1,
        max: 9,
        value: 1,
        slide: function( event, ui ) {
            $('#lead-slider-responsive')[ 0 ].selectedIndex = ui.value - 1;
            $('#lead-slider-responsive').selectpicker('refresh');
            var name = $('#lead-slider-responsive').attr('data-to-hidden');
            $('.lead form input[name='+name+']').val($("#lead-slider-responsive option[value='"+ui.value+"']").text());
        }
    });

    $('#lead-slider-responsive').on( "change", function() {
        $("#lead-slider").slider( "value", this.selectedIndex + 1 );
        var name = $(this).attr('data-to-hidden');
        $('.lead form input[name='+name+']').val($(this).find("option[value='"+$(this).val()+"']").text());
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

    $('.lead .more-info').click(function () {
        $(this).hide();
        $(this).prev('.form-group').slideDown();
    });

    $('.lead input[data-to-hidden]').each(function () {
        $(this).change(function () {
            var name = $(this).attr('data-to-hidden');
            $('.lead form input[name='+name+']').val($(this).val());
        });
    });

    $('.lead textarea[data-to-hidden]').each(function () {
        $(this).change(function () {
            var name = $(this).attr('data-to-hidden');
            $('.lead form input[name='+name+']').val($(this).val());
        });
    });

    $('.lead .btn:not(.dropdown-toggle)').click(function () {
        $('.lead form').submit();
        return false;
    });

    calcRootFontSize();
    createPortfolioBreakepoints();
    loadResponsiveBackground();
    $(window).resize(function () {
        calcRootFontSize();
        createPortfolioBreakepoints();
        loadResponsiveBackground();
        movingGradient.resize();
    });

    loadNextPageOnScroll();
    animateBoxPresent();
    $(window).scroll(function(){
        loadNextPageOnScroll();
        animateBoxPresent();
    });
    setPortfolioTexts();
    movingGradient.init();
});

function calcRootFontSize() {
    var windowW = $(window).width();
    var a = 0.003348214286;
    var b = 7.571428571;

    $('html').css('font-size', +(windowW*a)+b+'px');
}

$(window).load(function () {
    showNewsImages();
    showPortfolioImages();
    paralaxShowWebsite();
    $(window).scroll(function(){
        showNewsImages();
        showPortfolioImages();
        paralaxShowWebsite();
    });
});

var portfolioTexts = {};
function setPortfolioTexts() {
   /* var portfolio = $('.portfolio');
    if(portfolio.length){
        portfolio.find('.result > .box').each(function () {
            portfolioTexts[$(this).attr('data-id')] = $(this).find('.text').html().trim();
        });
    }
    return portfolioTexts;*/
}
function getPortfolioTexts(id) {
    return portfolioTexts[id]!==""?portfolioTexts[id]:undefined;
}

function findPortfolioBreakpoint() {
    var portfolioBreakpoints = [
        {
            bk: 1024,
            count: 9
        },
        {
            bk: 768,
            count: 6
        },
        {
            bk: 480,
            count: 4
        },
        {
            bk: 0,
            count: 3
        }
    ];

    for(var breakpoint in portfolioBreakpoints){
        if($(window).width()>=portfolioBreakpoints[breakpoint].bk)
            return portfolioBreakpoints[breakpoint].count;
    }
}

function loadResponsiveBackground(){
    $('*').each(function () {
        if($(this).attr('data-responsive-bg') != undefined && $(this).attr('data-responsive-bg') != ""){
            var backgroundBreakepoints = JSON.parse($(this).attr('data-responsive-bg'));

            for(var breakpoint in backgroundBreakepoints){
                if($(window).width()>=backgroundBreakepoints[breakpoint].bk){
                    $(this).css("background-image", "url("+backgroundBreakepoints[breakpoint].image+")");
                    return false
                }
            }
        }
    });
}

function createPortfolioBreakepoints() {
    $('.portfolio .result .box').removeClass('firstInRow');
    var i = 0;
    var bp = findPortfolioBreakpoint();
    $('.portfolio .result .box:visible').each(function () {
        if(i%bp == 0)
            $(this).addClass('firstInRow');
        i++;
    });
}

function filterPortfolio(pattern) {
    var text = [];
    var others = [];
    if(pattern != '' && pattern != undefined){
        text = pattern.split('+');
        var active;
        for(var i = 0; i<text.length; i++){
            active = $('.portfolio .filter span[data-filter="'+text[i]+'"]');
            active.parent().find('span').removeClass('active');
            active.addClass('active');
        }
        $('.filter-top-text-toggle > div').hide();
        $('.filter-top-text-toggle > div[data-type="'+pattern+'"]').show();
    }else{
        $('.portfolio .filter span.active').each(function () {
            var filter = $(this).attr("data-filter");
            if(filter == '!'){
                $(this).parent().find('span').each(function () {
                    filter = $(this).attr("data-filter");
                    if(filter != '!' && filter != '*'){
                        others.push(filter);
                    }
                });
            }else if(filter != "*"){
                text.push(filter);
            }

        });
    }
    var regExPatern = "";
    if(others.length>0){
        regExPatern = ".*";
        for(var i = 0; i<others.length; i++){
            if(i == 0){
                regExPatern += others[i];
            }else{
                regExPatern += "|"+others[i];
            }
        }
        regExPatern += ".*";

        var regExPaternOthers = "";
        if(text[0] == undefined || text[0] == "undefined"){
            regExPaternOthers = ".*";
        }else{
            regExPaternOthers = ".*"+text[0]+".*";
        }
        var regexOthers = new RegExp(regExPaternOthers);

    }else if(text.length == 0){
        regExPatern = ".*";
    }else if(text.length == 1){
        regExPatern = ".*" + text[0] + ".*"
    }else if(text.length == 2){
        regExPatern = ".*" + text[0] + ".*"+text[1] + "|" + text[1]+".*"+text[0] + ".*"
    }else{
        console.error("Wrong regex pattern!!");
    }
    var regex = new RegExp(regExPatern);
    var ele = $('.portfolio .result .box');
    ele.hide();
    ele.removeClass('firstInRow');
    var i = 0;
    var bp = findPortfolioBreakpoint();
    ele.each(function () {
        var thisKey = $(this).attr("data-filter-key");
        if(others.length>0){
            if((regexOthers.test(thisKey) && !regex.test(thisKey) && others.length>0)){
                showThis($(this));

            }

        }else{
            if(regex.test(thisKey)){
                showThis($(this));
            }
        }
    });


    function showThis(thisEl){
        thisEl.show();
        if(i%bp == 0)
            thisEl.addClass('firstInRow');
        i++;

        showPortfolioImages();
    }
}

function showNewsImages() {
    var win = $(window);

    var viewport = {
        top : win.scrollTop()
    };
    viewport.bottom = viewport.top + win.height();

    var thisVisible;
    var srcImageNews;
    $('.news-list .news').each(function () {
        var bounds = $(this).offset();

        if(viewport.bottom > bounds.top){
            thisVisible = $(this);
            srcImageNews = thisVisible.find('img').attr('data-src');
            thisVisible.find('img').attr('src', srcImageNews);
            thisVisible.animate({opacity: 1}, 250);
        }
    });
}
function showPortfolioImages() {
    var win = $(window);

    var viewport = {
        top : win.scrollTop()
    };
    viewport.bottom = viewport.top + win.height();

    $('.portfolio .box').each(function () {
        var bounds = $(this).offset();
        if(viewport.bottom > bounds.top && $(this).css('display') != 'none'){
            loadImagesPortfolio($(this));
        }
    });
}
function loadImagesPortfolio(thisVisible) {
    var srcImageNews;
    thisVisible.find('.image-wrap img').each(function () {
        if($(this).attr('src') == ""){
            srcImageNews = $(this).attr('data-src');
            $(this).attr('src', srcImageNews);
        }
    });
    thisVisible.animate({opacity: 1}, 250);
}

function loadNextPageOnScroll() {
    var offsetTopLoader = 0;
    var loaderEl = $('.loader-next-page');
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
                window.location.href = loaderEl.children().attr('data-next-page');
            }
        }else{
            overlayEl.width('100%');
            percentEl.text(0);
        }
    }
}

function paralaxShowWebsite(){
    var speed = 0.3;
    var offset = $(window).height()*0.7;
    $('.paralax-website').each(function () {

        var thisTop = $(this).offset().top - offset;
        var scrollTop = $(window).scrollTop();

        if(thisTop<scrollTop){
            $(this).css("background-position", "center -"+(scrollTop-thisTop)*speed+"px");
        }else{
            $(this).css("background-position", "center 0px");
        }
    });
}

function animateBoxPresent() {
    var offset = $(window).height()*0.85;

    $('.animate:not(.animate-finished)').each(function () {
        var thisTop = $(this).offset().top - offset;
        var scrollTop = $(window).scrollTop();

        if(thisTop<scrollTop){
            $(this).addClass("animate-finished");
        }
    });
}

var movingGradient = {
    config: {
        el: document.querySelector('.js-movingGradient'),
        x: null,
        lastPosition: null,
        unit: window.innerWidth / 100,
        value: 0
    },

    bindEvents: function() {
        if(!this.config.el) return;
        this.config.el.addEventListener('mousemove', this.mouseMove.bind(this));
    },

    moveGradient: function(position) {
        if(position === this.config.lastPosition) return;
        if(position >= 98) position = 100;
        if(!this.isNumber(position)) position = 50;

        this.config.el.style.background = `linear-gradient(22deg, #8effb9 0%,#a2e0e7 ${position}%,#829ce7 100%)`;
        this.config.lastPosition = position;
    },

    mouseMove: function(e) {
        var config = this.config;
        config.x = e.clientX;
        config.value = Math.floor(config.x / config.unit);

        requestAnimationFrame(this.moveGradient.bind(this,config.value));
    },

    isNumber: function(n) {
        return !isNaN(parseFloat(n)) && isFinite(n);
    },

    resize: function() {
        this.config.unit = window.innerWidth / 100;
    },

    init: function() {
        this.bindEvents();
    }
};
