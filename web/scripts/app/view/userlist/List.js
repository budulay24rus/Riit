/**
 * This view is an example list of people.
 */
Ext.define('edutask.view.userlist.List', {
	extend : 'Ext.grid.Panel',
	xtype : 'userlist',
	controller : 'userlist',
	layout : 'fit',
	id : 'Userlistgrid',
	reference : 'Userlistgrid',
	requires : [ 'edutask.store.Userlist', 'Ext.grid.Panel',
			'Ext.ux.CheckColumn' ],
	border : true,
	frame : false,
    hideHeaders: false,  
	title : '',

	initComponent : function() {
		userGrid = this;
		userGrid.store = Ext.create('edutask.store.Userlist');
		userGrid.columns = [ {
			text : 'Пользователь',
			align : 'left',
			dataIndex : 'user_name',
			flex : 1,
			sortable : false,
			menuDisabled: true
		}, {
			text : 'Город',
			dataIndex : 'city_name',
			align : 'center',
			sortable : false,
			flex : 1,
			menuDisabled: true
		}, {
			text : 'Образование',
			dataIndex : 'education_level',
			align : 'center',
			sortable : false,
			width : 140,
			menuDisabled: true
		}];

		userGrid.bbar = [ {
			name : 'btnEdituser',
			height : 35,
			action: 'editUser',
			text : 'Редактировать'
		}];

		userGrid.dockedItems = [ {
			xtype : 'pagingtoolbar',
			itemId : 'pagingtoolbar',
			id: 'userGridPaging',
			store : userGrid.store,
			dock : 'bottom',
			displayInfo : true
		} ];

		this.callParent();
	},

	afterRender : function() {
		this.callParent(arguments);
		this.getStore().loadPage(1);
	}
});
