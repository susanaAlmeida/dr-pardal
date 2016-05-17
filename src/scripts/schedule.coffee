'use strict'
getCurrentDateTime = =>

  now     = moment.tz('Europe/Lisbon')
  minutes = if now.minutes() < 10 then minute = '0' + now.minutes() else now.minutes()

  today =
    time:       now.hours() + 'h' + minutes
    isSaturday: now.day() == 6
    isSunday:   now.day() == 0
    elapsed:    now.hour() * 3600000 + now.minutes() * 60000 + now.seconds() * 1000

setSchedule = (today) =>
  if!today.isSaturday && !today.isSunday
    openingTime = 30600000
    closingTime = 70200000
  else if today.isSaturday
    openingTime = 32400000
    closingTime = 46800000

  if today.elapsed >= openingTime and today.elapsed <= closingTime
    width   = (today.elapsed - openingTime) * 100 / (closingTime - openingTime)
    warning = if closingTime - today.elapsed <= 900113 then true else false

    setBarWidth !today.isSaturday && !today.isSunday, width, today.time, warning
  else
    $('.schedule .separator').addClass('closed')

setBarWidth = (isWeek, width, time, warning) =>
  if isWeek then line = $('.timeline.week .line-filler') else line = $('.timeline.weekend .line-filler')
  if warning then line.addClass('with-warning')

  line
    .addClass('active')
    .css('width', width + '%')
    .get(0).setAttribute('data-hour', time)

$ ->
  setSchedule(getCurrentDateTime())

  setInterval ( ->
    setSchedule(getCurrentDateTime())
  ), 60000
