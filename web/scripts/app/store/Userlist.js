Ext.define('edutask.store.Userlist', {
	extend : 'Ext.data.Store',
	model : 'edutask.model.Userlist',
	id : 'UserlistsStore',
	alias : 'store.Userlist',
	autoLoad : false,
	pageSize : 20,
	enablePaging : true,
	autoSync : false,
	autoSave : true

});