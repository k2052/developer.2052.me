#= require 'prism/prism'
#= require 'prism/plugins/autolinker/prism-autolinker'
#= require 'prism-markdown'
#= require 'jquery/dist/jquery.js'

addLineNumbers = ->
  # works only for <code> wrapped inside <pre data-line-numbers> (not inline)
  pre = $('.editor pre')[0]
  return if not pre or not /pre/i.test(pre.nodeName) or pre.className.indexOf("line-numbers") is -1

  divheight = $(".editor code").height()
  lineheight = $(".editor code").css('line-height').replace("px","")

  linesNum = Math.round(divheight/parseInt(lineheight)) + 2

  lineNumbersWrapper = undefined

  lines = new Array(linesNum)
  lines = lines.join("<span></span>")

  lineNumbersWrapper = document.createElement("span")
  lineNumbersWrapper.className = "line-numbers-rows"
  lineNumbersWrapper.innerHTML = lines

  pre.style.counterReset = "linenumber " + (parseInt(pre.getAttribute("data-start"), 10) - 1) if pre.hasAttribute("data-start")
  $('.editor code')[0].appendChild lineNumbersWrapper

Prism.hooks.add "after-highlight", (env) ->
  addLineNumbers()
