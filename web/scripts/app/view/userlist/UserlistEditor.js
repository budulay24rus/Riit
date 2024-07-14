Ext.define('edutask.view.userlist.UserlistEditor', {
	extend: 'Ext.form.Panel',
	requires: [
		'edutask.store.Educations'
	],
	xtype: 'userlistEditor',
	hidden: true,
	id: 'userlistEditor',
	reference: 'userlistEditor',
	closeAction: 'hide',
	border: true,
	frame: false,
	title: '',
	width: 500,
	height: 300,
	minWidth: 300,
	minHeight: 220,
	layout: 'fit',
	plain: true,
	controller: 'userlist',
	items: [{
		xtype: 'form',

		defaultType: 'textfield',
		fieldDefaults: {
			labelWidth: 90
		},

		layout: {
			type: 'vbox',
			align: 'stretch'
		},

		bodyPadding: 15,
		border: false,

		items: [{
			fieldLabel: 'Пользователь',
			name: 'user_name'
		}, {
			fieldLabel: 'Город',
			xtype: 'textareafield',
			name: 'city_name'
		}, {
			fieldLabel: 'Образование',
			name: 'education_id',
			xtype: 'combobox',
			autoSelect: true,
			store: {
				type: 'Educations'
			},
			valueField: 'education_id',
			displayField: 'education_level',
			queryMode: 'remote'
		}]
	}],

	buttons: [{
		text: 'Сохранить',
		height: 32,
		action: 'saveUserlist'
	}, {
		text: 'Отмена',
		height: 32,
		action: 'cancelEdituserlist'
	}]
});