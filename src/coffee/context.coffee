Dispatcher             = require 'mycs/js/dispatcher'
ViewNode               = require 'two-trees/src/js/view-node'
Scrollable             = require './container/scrollable'
VariableHeightTileList = require './container/variable-height-tile-list'


class VariableRowRenderer extends ViewNode

    @getLayout: (data) ->
        [data.height, data.width]


    render: () ->
        tag:      'div'
        style:    "position: absolute; top: #{@cfg.y}px; height: #{@cfg.h}px; width: #{@cfg.w}px; background-color: #000000; border-bottom: 1px solid #333333; white-space: nowrap;"
        children: [
            tag:   'div'
            style: 'display: inline-block; width: 100px; height: 100%; border-right: 1px solid #333333'
            text:  @cfg.data.index
        ,
            tag:   'div'
            style: 'display: inline-block; width: 200px; height: 100%; border-right: 1px solid #333333'
            text:  'h: ' + @cfg.data.height
        ,
            tag: 'div'
            style: 'display: inline-block; width: calc(100% - 300px); height: 100%;'
            text: 'th: ' + @cfg.data.totalHeight
        ]






class Context extends Dispatcher


    constructor: () ->
        super()
        #@showScrollable()
        @showVariableHeightTileList()




    showVariableHeightTileList: () ->
        data   = []
        height = 0
        for i in [0 ... 2000000]
            h       = (Math.random() * 500 + 350) >> 0
            height += h
            data.push
                index:       i
                height:      h
                width:       (Math.random() * 1000 + 700) >> 0
                totalHeight: height


        @app = new VariableHeightTileList
            inject:         ctx: @
            overflowY:      'scroll'
            overflowX:      'scroll'
            forceDirection: true
            data:           data
            renderer:       VariableRowRenderer

        @app.appendTo document.querySelector '.app'




    showScrollable: () ->
        rowHeight     = '300px'
        rowInnerWidth = '200000px'

        @app = new Scrollable
            inject:         ctx: @
            overflowY:      'auto'
            overflowX:      'auto'
            forceDirection: true
            children: [
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0000;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #0000FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FFFF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF00FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF9900;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF99;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0099;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0000;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #0000FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FFFF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF00FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF9900;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF99;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0099;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0000;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #0000FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FFFF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF00FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF9900;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF99;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0099;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0000;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #0000FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FFFF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF00FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF9900;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF99;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0099;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0000;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #0000FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FFFF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF00FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF9900;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF99;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0099;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0000;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #0000FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FFFF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF00FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF9900;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF99;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0099;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0000;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #0000FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FFFF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF00FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF9900;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF99;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0099;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0000;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #0000FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FFFF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF00FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF9900;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF99;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0099;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0000;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #0000FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FFFF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF00FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF9900;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF99;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0099;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0000;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #0000FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FFFF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF00FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF9900;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF99;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0099;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0000;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #0000FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FFFF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF00FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF9900;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF99;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0099;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0000;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #0000FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FFFF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF00FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF9900;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF99;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0099;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0000;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #0000FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FFFF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF00FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF9900;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF99;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0099;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0000;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #0000FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FFFF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF00FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF9900;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF99;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0099;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0000;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #0000FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FFFF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF00FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF9900;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF99;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0099;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0000;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #0000FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FFFF00;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF00FF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF9900;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #FFFFFF;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #00FF99;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #000000;"
                ]
            ,
                tag:   'div'
                style: "overflow: hidden; white-space: nowrap; height: #{rowHeight};"
                children: [
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #CCCCCC;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: #{rowInnerWidth}; height: 100%; background-color: #FF0099;"
                ,
                    tag: 'div'
                    style: "display: inline-block; width: 50px; height: 100%; background-color: #333333;"
                ]
            ]

        @app.appendTo document.querySelector '.app'



module.exports = Context

