Scroller  = require './scroller'




class HScroller extends Scroller


    onThumbDown: (event) =>
        event.preventDefault()
        event.stopPropagation()
        @startX   = event.pageX
        @startPos = @thumbPos
        @emap.map document, "mousemove", @onThumbMove, @
        @emap.map document, "mouseup",   @onThumbUp,   @


    onThumbMove: (event) ->
        tp = @startPos + event.pageX - @startX
        if @thumbPos != tp
            @updateThumbPos tp


    onThumbUp: () ->
        @emap.unmap document, "mousemove", @onThumbMove, @
        @emap.unmap document, "mouseup",   @onThumbUp,   @


    render: () ->
        tag:       'div'
        className: 'scroller h-scroller'
        children:  [
            tag:       'div'
            className: 'scroller__track h-scroller__track'
        ,
            tag:         'div'
            className:   'scroller__thumb h-scroller__thumb'
            style:       "left: #{@thumbPos}px; width: #{@thumbSize}px"
            onMousedown: @onThumbDown
        ]




module.exports = HScroller