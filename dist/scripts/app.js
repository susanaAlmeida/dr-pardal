'use strict';
var initExpandButton, initGridAnimations, initHeroBanner, initResponsiveMenu, initScrollSpy, initScrollTo, resetPosition, setNavItemActive;

initScrollSpy = (function(_this) {
  return function() {
    var headerHeight, navBarItems, scrollItems;
    navBarItems = $('.nav a');
    headerHeight = $('header').outerHeight();
    scrollItems = $('section').map(function() {
      if (this.id) {
        return this;
      }
    });
    return scrollItems.each(function(i, section) {
      var waypoint;
      if (section.id) {
        return waypoint = new Waypoint({
          offset: headerHeight,
          element: section,
          handler: function(direction) {
            if (direction === 'down') {
              return setNavItemActive(navBarItems[i]);
            } else {
              return setNavItemActive(navBarItems[i - 1]);
            }
          }
        });
      }
    });
  };
})(this);

setNavItemActive = (function(_this) {
  return function(item) {
    $('.nav .active').removeClass('active');
    return $(item).addClass('active');
  };
})(this);

initScrollTo = (function(_this) {
  return function() {
    return $('.nav a, a.brand').click(function(e) {
      var offset, target;
      e.preventDefault();
      target = $(this).attr('href');
      if (target !== '#') {
        offset = $(target).offset().top;
      } else {
        offset = 0;
      }
      return $('html,body').animate({
        scrollTop: offset - $('header').outerHeight() + 1
      }, 500);
    });
  };
})(this);

initExpandButton = (function(_this) {
  return function() {
    return $('.exams-grid .expand-button').on('click', function() {
      return $(this).parent().addClass('expanded');
    });
  };
})(this);

initResponsiveMenu = (function(_this) {
  return function() {
    return $('.nav a').on('click', function() {
      return $('header label').trigger('click');
    });
  };
})(this);

initGridAnimations = (function(_this) {
  return function() {
    var $window, elementsToAnimate, startOffset;
    startOffset = 140;
    $window = $(window).height();
    elementsToAnimate = [$('.exams-grid'), $('.team-grid'), $('.partners-grid'), $('.image-wrapper')];
    return $(elementsToAnimate).each(function(i, element) {
      var waypoint;
      return waypoint = new Waypoint({
        element: element,
        offset: $window - startOffset,
        handler: function(direction) {
          return element.addClass('animated');
        }
      });
    });
  };
})(this);

resetPosition = (function(_this) {
  return function(element) {
    return element.css({
      'position': 'absolute',
      'top': '30%'
    });
  };
})(this);

initHeroBanner = (function(_this) {
  return function(resized) {
    var $textWrapper, $trigger, waypoint;
    $textWrapper = $('.hero-banner .text-container');
    $trigger = $('.hero-banner .trigger');
    if ($trigger.height()) {
      waypoint = new Waypoint({
        element: $trigger,
        handler: function(direction) {
          if (direction === 'down') {
            $textWrapper.css('top', this.triggerPoint + ($textWrapper.height() / 2) + 'px');
            return $textWrapper.css('position', 'absolute');
          } else {
            $textWrapper.css('position', 'fixed');
            return $textWrapper.css('top', '140px');
          }
        }
      });
      return $(window).on('resize', function() {
        waypoint.destroy();
        return resetPosition($textWrapper);
      });
    } else if ($('window').width() <= 860) {
      return resetPosition($textWrapper);
    }
  };
})(this);

$(function() {
  initScrollSpy();
  initExpandButton();
  initResponsiveMenu();
  initScrollTo();
  initGridAnimations();
  return initHeroBanner();
});

'use strict';
var initMap;

initMap = (function(_this) {
  return function() {
    var draggable, map, marker, myLatlng, styles, width;
    width = $(window).width();
    myLatlng = {
      lat: 41.547122,
      lng: -8.421819
    };
    styles = [
      {
        featureType: "water",
        elementType: "geometry",
        stylers: [
          {
            color: "#e9e9e9"
          }, {
            lightness: 17
          }
        ]
      }, {
        featureType: "landscape",
        elementType: "geometry",
        stylers: [
          {
            color: "#f5f5f5"
          }, {
            lightness: 20
          }
        ]
      }, {
        featureType: "road.highway",
        elementType: "geometry.fill",
        stylers: [
          {
            color: "#ffffff"
          }, {
            lightness: 17
          }
        ]
      }, {
        featureType: "road.highway",
        elementType: "geometry.stroke",
        stylers: [
          {
            color: "#ffffff"
          }, {
            lightness: 29
          }, {
            weight: 0.2
          }
        ]
      }, {
        featureType: "road.arterial",
        elementType: "geometry",
        stylers: [
          {
            color: "#ffffff"
          }, {
            lightness: 18
          }
        ]
      }, {
        featureType: "road.local",
        elementType: "geometry",
        stylers: [
          {
            color: "#ffffff"
          }, {
            lightness: 16
          }
        ]
      }, {
        featureType: "poi",
        elementType: "geometry",
        stylers: [
          {
            color: "#f5f5f5"
          }, {
            lightness: 21
          }
        ]
      }, {
        featureType: "poi.park",
        elementType: "geometry",
        stylers: [
          {
            color: "#dedede"
          }, {
            lightness: 21
          }
        ]
      }, {
        elementType: "labels.text.stroke",
        stylers: [
          {
            visibility: "on"
          }, {
            color: "#ffffff"
          }, {
            lightness: 16
          }
        ]
      }, {
        elementType: "labels.text.fill",
        stylers: [
          {
            saturation: 36
          }, {
            color: "#333333"
          }, {
            lightness: 40
          }
        ]
      }, {
        elementType: "labels.icon",
        stylers: [
          {
            visibility: "off"
          }
        ]
      }, {
        featureType: "transit",
        elementType: "geometry",
        stylers: [
          {
            color: "#f2f2f2"
          }, {
            lightness: 19
          }
        ]
      }, {
        featureType: "administrative",
        elementType: "geometry.fill",
        stylers: [
          {
            color: "#fefefe"
          }, {
            lightness: 20
          }
        ]
      }, {
        featureType: "administrative",
        elementType: "geometry.stroke",
        stylers: [
          {
            color: "#fefefe"
          }, {
            lightness: 17
          }, {
            weight: 1.2
          }
        ]
      }
    ];
    if (width > '768') {
      draggable = true;
    } else {
      draggable = false;
    }
    map = new google.maps.Map(document.getElementById('map'), {
      zoom: 18,
      center: myLatlng,
      styles: styles,
      zoomControl: false,
      mapTypeControl: false,
      streetViewControl: false,
      scrollwheel: false,
      draggable: draggable
    });
    marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      draggable: false,
      icon: {
        url: 'images/pin.svg'
      },
      url: 'https://goo.gl/maps/cNHcvRGVXTn'
    });
    marker.addListener('click', function() {
      return window.open(this.url, '_blank');
    });
    return $('.map-wrapper').find('button').on('click', function() {
      if ($(this).hasClass('more')) {
        return map.setZoom(map.getZoom() + 1);
      } else {
        return map.setZoom(map.getZoom() - 1);
      }
    });
  };
})(this);

$(function() {
  return initMap();
});

'use strict';
var getCurrentDateTime, setBarWidth, setSchedule;

getCurrentDateTime = (function(_this) {
  return function() {
    var minute, minutes, now, today;
    now = moment.tz('Europe/Lisbon');
    minutes = now.minutes() < 10 ? minute = '0' + now.minutes() : now.minutes();
    return today = {
      time: now.hours() + 'h' + minutes,
      isSaturday: now.day() === 6,
      isSunday: now.day() === 0,
      elapsed: now.hour() * 3600000 + now.minutes() * 60000 + now.seconds() * 1000
    };
  };
})(this);

setSchedule = (function(_this) {
  return function(today) {
    var closingTime, openingTime, warning, width;
    if (!today.isSaturday && !today.isSunday) {
      openingTime = 30600000;
      closingTime = 70200000;
    } else if (today.isSaturday) {
      openingTime = 32400000;
      closingTime = 46800000;
    }
    if (today.elapsed >= openingTime && today.elapsed <= closingTime) {
      width = (today.elapsed - openingTime) * 100 / (closingTime - openingTime);
      warning = closingTime - today.elapsed <= 900113 ? true : false;
      return setBarWidth(!today.isSaturday && !today.isSunday, width, today.time, warning);
    } else {
      return $('.schedule .separator').addClass('closed');
    }
  };
})(this);

setBarWidth = (function(_this) {
  return function(isWeek, width, time, warning) {
    var line;
    if (isWeek) {
      line = $('.timeline.week .line-filler');
    } else {
      line = $('.timeline.weekend .line-filler');
    }
    if (warning) {
      line.addClass('with-warning');
    }
    return line.addClass('active').css('width', width + '%').get(0).setAttribute('data-hour', time);
  };
})(this);

$(function() {
  setSchedule(getCurrentDateTime());
  return setInterval((function() {
    return setSchedule(getCurrentDateTime());
  }), 60000);
});
