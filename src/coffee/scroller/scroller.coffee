EMap      = require 'emap'
ViewNode  = require 'two-trees/src/js/view-node'
getBounds = require 'mycs/js/get-bounds'
Rect      = require 'mycs/js/rect'




class Scroller extends ViewNode


    @MIN_THUMB_SIZE: 10


    init: (cfg) ->
        @emap            = new EMap();
        @thumbPos        = 0
        @scrollPos       = 0
        @minThumbSize    = if isNaN(cfg.minThumbSize) then Scroller.MIN_THUMB_SIZE else cfg.minThumbSize
        @thumbRestricted = false
        @bounds          = new Rect()


    updateBounds: () ->
        getBounds @view, @bounds


    updateScrollPos: (scrollPos) ->
        maxTp     = @containerSize - @thumbSize
        maxSp     = @containerSize - @contentSize
        @thumbPos = Math.max Math.min(scrollPos / maxSp * maxTp, maxTp), 0
        if maxTp != 0
            scrollPos = @thumbPos / maxTp * maxSp
        else
            scrollPos = 0

        if @scrollPos != scrollPos
            @scrollPos = scrollPos
            @cfg.onScroll @scrollPos


    updateThumbPos: (thumbPos) ->
        maxTp     = @containerSize - @thumbSize
        maxSp     = @containerSize - @contentSize
        scrollPos = Math.min Math.max(thumbPos / maxTp * maxSp, maxSp), 0
        @thumbPos = scrollPos / maxSp * maxTp

        if @scrollPos != scrollPos
            @scrollPos = scrollPos
            @cfg.onScroll @scrollPos


    setScrollBounds: (containerSize, contentSize) ->
        @thumbSize     = Math.max Math.min(containerSize * containerSize / contentSize, containerSize), @minThumbSize
        @containerSize = containerSize
        @contentSize   = contentSize
        @updateScrollPos @scrollPos


    setScrollPos: (scrollPos) ->
        @updateScrollPos scrollPos




module.exports = Scroller