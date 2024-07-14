Ext.define('edutask.view.main.MainController', {
	extend: 'Ext.app.ViewController',
	alias: 'controller.main',

	onSelectItem: function(button) {
		var index = button.tabIndex,
			contentItems = Ext.ComponentMgr.get('content-items');
		var l = contentItems.getLayout();
		var step = 'step' + index;
		var activeIndex = l.activeItem.id.split('step')[1];
		var i = parseInt(activeIndex, 10);
		if (index != i) {
			l.setActiveItem(step);
		}
	},

	onClickButton: function() {
		var me = this;
		Ext.Ajax.request({
			url: 'http://localhost/hosp/web/site/ajaxlogout',
			success: function(result, request) {
				var res = Ext.JSON.decode(result.responseText);
				if (res.success) {
					me.getView().destroy();
					Ext.create({
						xtype: 'login'
					});
				}
			}
		});

	}
});
