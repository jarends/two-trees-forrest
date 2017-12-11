getBounds  = require 'mycs/js/get-bounds'
Scrollable = require './scrollable'




class VariableHeightTileList extends Scrollable


    init: (cfg) ->
        super cfg
        @rendererMap = {}
        @cache       = []
        @startIndex  = 0
        @endIndex    = 0
        @totalHeight = 0
        @drawTimeout = null


    updateCfg: (cfg) ->
        super cfg
        @layouts = []
        height   = 0
        width    = 0
        clazz    = cfg.renderer

        for d in cfg.data
            l       = clazz.getLayout d
            height += l[0]
            width   = l[1] if l[1] > width
            #l.push height
            @layouts.push
                h: l[0]
                w: width
                y: height

        @contentBounds.height = height
        @contentBounds.width  = width or 0
        console.log 'contentBounds: ', @contentBounds


    updateBounds: () ->
        getBounds @view, @containerBounds
        @updateScrollers()
        @drawLater()


    onScrollTop: (scrollTop) ->
        super scrollTop
        @drawLater()


    onScrollLeft: (scrollLeft) ->
        super scrollLeft
        @drawLater()


    draw: () ->
        window.cancelAnimationFrame @drawTimeout

        @startIndex = -1
        content     = @content.view
        clazz       = @cfg.renderer
        data        = @cfg.data
        y0          = 0
        y1          = 0
        oldMap      = @rendererMap
        newMap      = {}
        t           = -@scrollTop
        b           = t + @containerBounds.height
        w           = @contentBounds.width or @containerBounds.width

        for d, i in data by -1
            layout = @layouts[i]
            h      = layout.h
            y1     = y0 + h
            if (y0 <= t and y1 >= t) or (y0 <= b and y1 >= b) or (y0 <= t and y1 >= b) or (y0 >= t and y1 <= b)
                @startIndex = i if @startIndex == -1
                @endIndex   = i

                renderer = oldMap[i]
                cfg      =
                    data:   d
                    y:      y0 + @scrollTop
                    h:      h
                    w:      w
                    keep:   true
                    inject: @cfg.inject

                if not renderer
                    renderer = @cache.pop()
                    if not renderer
                         renderer = new clazz cfg
                    else
                        renderer.updateCfg cfg
                        renderer.updateNow()
                    renderer.appendTo content
                else
                    renderer.updateCfg cfg
                    renderer.updateNow()
                    delete oldMap[i]

                newMap[i] = renderer
            y0 = y1

        for i, renderer of oldMap
            renderer.remove()
            @cache.push renderer
        @rendererMap = newMap


    drawLater: () ->
        window.cancelAnimationFrame @drawTimeout
        @drawTimeout = window.requestAnimationFrame () => @draw()


    render: () ->
        cfg = super()
        cfg.children[0].child.style = "left: #{@scrollLeft}px; top: 0;"
        #delete cfg.children[0].child.children
        cfg




module.exports = VariableHeightTileList