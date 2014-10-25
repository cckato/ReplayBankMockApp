$(document).on 'page:change', ->

  #---------------------------------------------------
  # URLから、現在選択されているNavを判断
  # #nav-leftのul>li に .active を付与
  #---------------------------------------------------
  # URL取得
  path = window.location.pathname
  # すべて非アクティブ化
  $('.nav-left>li').each ->
    $(@).removeClass('active')
  # URLでマッチング
  if /users/.test(path)
    $('.nav-left-users').addClass('active')
  else if /help/.test(path)
    $('.nav-left-help').addClass('active')
  else if /movies/.test(path)
    $('.nav-left-movies').addClass('active')
