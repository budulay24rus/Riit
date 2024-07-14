Ext.define('edutask.model.Education', {

	extend : 'Ext.data.Model',
	idProperty : 'education_id',
	fields : [ 'education_level', 'education_id'],

	proxy : {
		type : 'ajax',

		api : {
			read : 'http://localhost/edutask/index.php?r=education%2Fget'
		},

		reader : {
			type : 'json',
			rootProperty : 'data',
			totalProperty : 'total',
			successProperty : 'success'
		},

		writer : {
			type : 'json',
			writeAllFields : true,
			encode : true,
			rootProperty : 'education',
			successProperty : 'success'
		}
	}
});