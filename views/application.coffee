(->
  t = new Trianglify({ cellsize: 300, noiseIntensity: 0.0, x_gradient: ['#AC679E', '#C34875', '#D5385D'], y_gradient: ['#220528', '#FBC3B6', '#D23D52'] })
  pattern = t.generate(document.body.clientWidth, document.body.clientHeight)
  global_bg = document.getElementById('global_bg')
  global_bg.setAttribute('style', 'background-image: '+pattern.dataUrl)
)()

(->
  main_header = $('#main_header a')
  pathname = window.location.pathname	

  show_home = ->
    main_header.css('cursor':'pointer', 'color': '#292929', 'opacity': '.5').text('«« BACK TO HOMEPAGE').fadeTo(300, 1)

  show_title = ->
    main_header.css('cursor':'pointer', 'color': 'white', 'opacity': '0.5').text('BETWEEN | SCREENS').fadeTo(200, 1) 

  main_header.hover(show_home, show_title) unless pathname == '/'
)()

