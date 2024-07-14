
Ext.define('edutask.view.userlist.UserlistController', {
	extend: 'Ext.app.ViewController',

	alias: 'controller.userlist',

	control: {
		'userlist dataview': { 
			itemdblclick: 'onItemDblClick'
		},
		'button[action=saveUserlist]': {
			click: 'saveUserlist'
		},
		'button[action=editUser]': {
			click: 'onItemDblClick'
		},
		'button[action=cancelEdituserlist]': {
			click: 'cancelEdituserlist'
		}
	},

	cancelEdituserlist: function(button) {
		var form = button.up('form');
		form.close();
		var e = Ext.ComponentMgr.get('Userlistgrid');
		if (e) {
			e.show();
		}
	},

	saveUserlist: function(button) {
		var frm_userlistform = button.up('form'), userlist = frm_userlistform
			.getRecord(), vals = frm_userlistform
				.getValues();
		var e = Ext.ComponentMgr.get('Userlistgrid');
		var apage = (e.store.currentPage - 1) * 20;
		frm_userlistform.updateRecord(userlist);

		userlist.save({
			success: function(record, operation) {
				var action = operation.request.config.action;
				if (e) {
					frm_userlistform.close();
					e.show();
					if (action == 'create') {
						e.store.insert(apage, record);
					}
				}
			},
			failure: function(record) {
				alert('Неудачно');
			}
		});
	},

	onItemDblClick: function(button) {
		var grid = button.up('grid'), sel = grid.getView()
			.getSelectionModel().getSelection()[0];
		if (sel != undefined) {
			grid.hide();
			var e = Ext.ComponentMgr.get('userlistEditor');
			e.getForm().loadRecord(sel);
			if (e) {
				e.show();
			}
		}

	}

});
