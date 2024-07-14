Ext.define('edutask.view.userlist.UserlistManager', {

    extend: 'Ext.panel.Panel',
    xtype: 'userlistManager',
    requires: [
        'Ext.container.Container',
        'edutask.view.userlist.UserlistController',
        'edutask.view.main.MainModel',
        'edutask.view.userlist.List',
        'edutask.view.userlist.UserlistEditor'
    ],
    layout: 'fit',
    border: false,
    items: [{
        xtype: 'userlist'
    }, {
        xtype: 'userlistEditor'
    }]

});