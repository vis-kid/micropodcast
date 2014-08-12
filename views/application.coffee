(->
  t = new Trianglify({ cellsize: 300, noiseIntensity: 0.0 })
  pattern = t.generate(document.body.clientWidth, document.body.clientHeight)
  global_bg = document.getElementById('global_bg')
  global_bg.setAttribute('style', 'background-image: '+pattern.dataUrl)
)()

(->
  main_header = $('#main_header a')
  pathname = window.location.pathname	

  show_home = ->
    main_header.css('cursor':'pointer').text('BACK TO HOMEPAGE')

  show_title = ->
    main_header.css('cursor':'pointer').text('BETWEEN | SCREENS')

  main_header.hover(show_home, show_title) unless pathname == '/'
)()
