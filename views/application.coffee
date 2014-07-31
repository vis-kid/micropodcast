t = new Trianglify({ cellsize: 300, noiseIntensity: 0.0 })
pattern = t.generate(document.body.clientWidth, document.body.clientHeight)
global_bg = document.getElementById('global_bg')
global_bg.setAttribute('style', 'background-image: '+pattern.dataUrl)
