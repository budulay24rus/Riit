Ext.define('edutask.model.Userlist', {

	extend : 'Ext.data.Model',
	idProperty : 'user_id',
	fields : [ 'user_name', 'city_name', 'education_id', 'education_level'],

	proxy : {
		type : 'ajax',

		api : {
			read : 'http://localhost/edutask/index.php?r=main%2Fgetusers',		
			update : 'http://localhost/edutask/index.php?r=main%2Fupdate'
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
			rootProperty : 'user',
			successProperty : 'success'
		}
	}
});