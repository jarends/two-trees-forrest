Scroller  = require './scroller'




class VScroller extends Scroller


    onThumbDown: (event) =>
        event.preventDefault()
        event.stopPropagation()
        @startY   = event.pageY
        @startPos = @thumbPos
        @emap.map document, "mousemove", @onThumbMove, @
        @emap.map document, "mouseup",   @onThumbUp,   @


    onThumbMove: (event) ->
        tp = @startPos + event.pageY - @startY
        if @thumbPos != tp
            @updateThumbPos tp


    onThumbUp: () ->
        @emap.unmap document, "mousemove", @onThumbMove, @
        @emap.unmap document, "mouseup",   @onThumbUp,   @


    render: () ->
        tag:       'div'
        className: 'scroller v-scroller'
        children:  [
            tag:       'div'
            className: 'scroller__track v-scroller__track'
        ,
            tag:         'div'
            className:   'scroller__thumb v-scroller__thumb'
            style:       "top: #{@thumbPos}px; height: #{@thumbSize}px"
            onMousedown: @onThumbDown
        ]




module.exports = VScroller