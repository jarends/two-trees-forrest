EMap      = require 'emap'
ViewNode  = require 'two-trees/src/js/view-node'
getBounds = require 'mycs/js/get-bounds'
Rect      = require 'mycs/js/rect'
VScroller = require '../scroller/v-scroller'
HScroller = require '../scroller/h-scroller'


class Scrollable extends ViewNode

    @SCROLLER_SIZE = 15


    init: (cfg) ->
        @emap            = new EMap()
        @scrollerSize    = Scrollable.SCROLLER_SIZE
        @scrollTop       = 0
        @scrollLeft      = 0
        @doScrollY       = false
        @doScrollX       = false
        @containerBounds = new Rect()
        @contentBounds   = new Rect()


    updateCfg: (cfg) ->
        @overflowY      = cfg.overflowY or 'auto'
        @overflowX      = cfg.overflowX or 'auto'
        @forceDirection = cfg.forceDirection != false
        super cfg


    onMount: () ->
        @emap.map window, 'resize', @onResize, @
        @container = @children[0]
        @vscroller = @children[1]
        @hscroller = @children[2]
        @content   = @container.children[0]
        @updateBounds()


    onUnmount: () ->
        @emap.all()
        @keep


    onResize: () ->
        @updateBounds()


    onWheel: (event) =>
        dy = event.deltaY
        dx = event.deltaX
        if event.deltaMode
            dy = dy * 14
            dx = dx * 14

        if @forceDirection
            dya = Math.abs dy
            dxa = Math.abs dx
            if dya > dxa
                dx = 0 if @doScrollY
            else if dya < dxa
                dy = 0 if @doScrollX

        @vscroller.setScrollPos @scrollTop  - dy if @doScrollY
        @hscroller.setScrollPos @scrollLeft - dx if @doScrollX
        @doUpdateContent = false
        @update()


    onScrollTop: (scrollTop) =>
        @scrollTop       = scrollTop
        @doUpdateContent = false
        @update()


    onScrollLeft: (scrollLeft) =>
        @scrollLeft      = scrollLeft
        @doUpdateContent = false
        @update()


    setScrollTop: (scrollTop) ->
        @vscroller.setScrollPos scrollTop


    setScrollLeft: (scrollLeft) ->
        @hscroller.setScrollPos scrollLeft


    updateBounds: () ->
        getBounds @view,         @containerBounds
        getBounds @content.view, @contentBounds
        @updateScrollers()


    updateScrollers: () ->
        sy         = @shouldScrollVertical()
        sx         = @shouldScrollHorizontal sy
        sy         = @shouldScrollVertical   sx if sx
        sy         = ((@overflowY == 'auto' and sy) or @overflowY == 'scroll') and @overflowY != 'none'
        sx         = ((@overflowX == 'auto' and sx) or @overflowX == 'scroll') and @overflowX != 'none'
        @doScrollY = sy
        @doScrollX = sx
        @containerBounds.height -= @scrollerSize if sx
        @containerBounds.width  -= @scrollerSize if sy
        @vscroller.setScrollBounds @containerBounds.height, @contentBounds.height if sy
        @hscroller.setScrollBounds @containerBounds.width,  @contentBounds.width  if sx

        @doUpdateContent = false
        @update()


    shouldScrollVertical: (shouldScrollHorizontal) ->
        @contentBounds.height > @containerBounds.height - (if shouldScrollHorizontal then @scrollerSize else 0)


    shouldScrollHorizontal: (shouldScrollVertical) ->
        @contentBounds.width > @containerBounds.width - (if shouldScrollVertical then @scrollerSize else 0)


    render: () ->
        sy = if @doScrollY then 'scroll-y' else ''
        sx = if @doScrollX then 'scroll-x' else ''
        ss = sy + (if sx and sy then ' ' else '') + sx

        cfg =
            tag:       'div'
            className: "#{@cfg.className or ''} scrollable #{ss}"
            onWheel:   @onWheel
            children: [
                tag:            'div'
                className:      'scrollable__container'
                updateChildren: @doUpdateContent
                child:
                    tag:       'div'
                    className: 'scrollable__content'
                    style:     "left: #{@scrollLeft}px; top: #{@scrollTop}px;"
                    children:  @cfg.children
            ,
                tag:      VScroller
                onScroll: @onScrollTop
            ,
                tag:      HScroller
                onScroll: @onScrollLeft
            ]
        console.log 'update content' if @doUpdateContent
        cfg




module.exports = Scrollable