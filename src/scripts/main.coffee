'use strict'

initScrollSpy = =>
  navBarItems  = $('.nav a');
  headerHeight = $('header').outerHeight()

  scrollItems = $('section').map(->
    if this.id then this
  )

  scrollItems.each (i, section) =>
    if section.id
      waypoint = new Waypoint(
        offset: headerHeight
        element: section
        handler: (direction) ->
          if direction is 'down'
            setNavItemActive(navBarItems[i])
          else
            setNavItemActive(navBarItems[i - 1])
)

setNavItemActive = (item) =>
  $('.nav .active').removeClass('active');
  $(item).addClass('active')

initScrollTo = =>
  $('.nav a, a.brand').click (e) ->
    e.preventDefault()
    target = $(this).attr('href')

    if target != '#' then offset = $(target).offset().top else offset = 0

    $('html,body').animate
      scrollTop: offset - $('header').outerHeight() + 1
      500

initExpandButton = =>
  $('.exams-grid .expand-button').on 'click', ->
    $(this).parent().addClass('expanded')

initResponsiveMenu = =>
  $('.nav a').on 'click', ->
    $('header label').trigger('click')

initGridAnimations = =>
  startOffset = 140
  $window = $(window).height()

  elementsToAnimate = [
    $('.exams-grid'),
    $('.team-grid'),
    $('.partners-grid'),
    $('.image-wrapper')
  ]

  $(elementsToAnimate).each (i, element) =>
    waypoint = new Waypoint(
      element: element
      offset: $window - startOffset
      handler: (direction) ->
        element.addClass('animated')
    )

resetPosition = (element) =>
  element.css({
    'position': 'absolute',
    'top': '30%'
  })

initHeroBanner = (resized) =>
  $textWrapper = $('.hero-banner .text-container')
  $trigger     = $('.hero-banner .trigger')

  if $trigger.height()
    waypoint = new Waypoint(
      element: $trigger

      handler: (direction) ->
        if direction == 'down'
          $textWrapper.css('top', this.triggerPoint + ($textWrapper.height()/2) + 'px');
          $textWrapper.css('position', 'absolute');
        else
          $textWrapper.css('position', 'fixed');
          $textWrapper.css('top', '140px');
    )

    $(window). on 'resize', =>
      waypoint.destroy()
      resetPosition($textWrapper)

  else if $('window').width() <= 860
    resetPosition($textWrapper)

$ ->
  initScrollSpy()
  initExpandButton()
  initResponsiveMenu()
  initScrollTo()
  initGridAnimations()
  initHeroBanner()
