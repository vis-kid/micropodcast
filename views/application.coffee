(->
  global_bg = document.getElementById('global_bg')
  footer_bg = document.getElementById('footer_bg')


  triangle_bg = new Trianglify({ cellsize: 100, noiseIntensity: 0.0, x_gradient: [ '#9E030A', '#E42F3A',  '#9E030A' ] })
  pattern = triangle_bg.generate(document.body.clientWidth, document.body.clientHeight)

# Header bg
  global_bg.setAttribute('style', 'background-image: '+pattern.dataUrl)
	
# Footer bg
  footer_bg.setAttribute('style', 'background-image: '+pattern.dataUrl)
)()


(->
  mainHeader = $('#main_header a')
  link01 = "http://between-screens.herokuapp.com/"
  link02 = "http://between-screens.herokuapp.com/?page=1"

  show_home = ->
    mainHeader.css('cursor':'pointer', 'color': '#292929', 'opacity': '.5').text('«« BACK TO HOMEPAGE').fadeTo(300, 1)

  show_title = ->
    mainHeader.css('cursor':'pointer', 'color': 'white', 'opacity': '0.5').text('BETWEEN | SCREENS').fadeTo(200, 1) 

  unless window.location.href == link01  or  window.location.href == link02
    mainHeader.hover(show_home, show_title) 
)()


(->
  mq = window.matchMedia( "(min-width: 1024px)" )
  knowledgeBombSection = $('#knowledge_bomb_section')

  if mq.matches
    if window.location.search.substring().match(/page=1/)    
      knowledgeBombSection.show()
    else if window.location.href == "http://between-screens.herokuapp.com/" 
      knowledgeBombSection.show()
    else
      knowledgeBombSection.remove()
)()

###

(->
	mq = window.matchMedia( "(min-width: 1024px)" )
	if mq.matches
    knowledgeBombSection = $('#knowledge_bomb_section')
    if window.location.href == "http://localhost:9393/?page=1" 
      knowledgeBombSection.show()
    else if window.location.href == "http://localhost:9393/" 
      knowledgeBombSection.show()
    else
      knowledgeBombSection.remove()
)()

###

(->
editor = new wysihtml5.Editor("wysihtml5-textarea", { 
  toolbar:      "wysihtml5-toolbar", 
  parserRules:  wysihtml5ParserRules })
)()
