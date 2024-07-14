/**
 * This class is the main view for the application. It is specified in app.js as
 * the "mainView" property. That setting automatically applies the "viewport"
 * plugin causing this view to become the body element (i.e., the viewport).
 * 
 * TODO - Replace this content of this view to suite the needs of your
 * application.
 */
Ext.define('edutask.view.main.Main', {

	extend : 'Ext.container.Viewport',
	xtype : 'app-main',

	requires : [ 'Ext.plugin.Viewport', 'edutask.view.main.MainController',
			'edutask.view.userlist.UserlistManager',
			'edutask.view.main.MainModel', 'edutask.view.userlist.List' ],
	controller : 'main',
	plugins : 'viewport',
	style : {
		'background-color' : 'white;'
	},
	layout : 'center',
	bodyBorder : false,

	defaults : {
		collapsible : false,
		split : false,
		bodyPadding : 0
	},
	items : [ {
		xtype : 'panel',
		bodyCls : 'your-css',
		width : '85%',
		height : '97%',
		maxWidth : 1000,
		maxHeight : 800,
		minWidth : 600,
		layout : 'border',
		items : [ {
			header : {
				hidden : true
			},
			region : 'north',
			floatable : false,
			bodyCls : 'your-css',
			border : false,
			minWidth : 100,
			maxWidth : 820,
			margin : '1px 1px 1px 15px',
			defaults : {
				height : 40
			},
			layout : {
				type : 'hbox',
				pack : 'end'
			},
			items : [ {
				xtype : 'panel',
				border : true,
				bodyStyle: 'padding: 10px 0px; background-color: #3892d4; color: #fff; font-weight:bold; border-style: solid; border-color: #126daf; border-width: 1px;',
                margin : '0px 0px 0px 0px',
				flex : 1,
				layout: {
                    type: 'hbox',
                    pack: 'center'                        
                },
				items : [ {
					xtype : 'label',
					height: 32,
					text : 'Пользователи'
				}]

			}]
		}, {
			header : {
				hidden : true
			},
			collapsible : false,
			itemId : 'content-items',
			id : 'content-items',
			border : false,
			maxWidth : 820,
			region : 'center',
			layout : 'card',
			margin : '0 0 0 15px',
			items : [ {
				xtype : 'userlistManager',
				itemId : 'step0',
				id : 'step0'
			} ]
		} ]
	} ]
});
