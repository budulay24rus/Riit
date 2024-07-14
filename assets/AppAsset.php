<?php

/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */
namespace app\assets;

use yii\web\AssetBundle;

/**
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle {
	public $basePath = '@webroot';
	public $baseUrl = '@web/scripts/';
	public $css = [ 
			'build/production/resources/edutask-all.css',
			'build/production/resources/root_over.css',
	];
	public $js = [ 
			'build/production/app.js' 
	    //'ext/build/ext-all-debug.js',
	    //'app.js'
	];
	public $depends = [ ];
}
