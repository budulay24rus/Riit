Ext.define('edutask.store.Educations', {
	extend : 'Ext.data.Store',
	model : 'edutask.model.Education',
	id : 'EducationsStore',
	alias : 'store.Educations',
	autoLoad : true,
	pageSize : 20,
	enablePaging : true,
	autoSync : false,
	autoSave : false

});