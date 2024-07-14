<?php
namespace app\models;

use yii\db\ActiveRecord;

class Users_list extends ActiveRecord
{
    public static function tableName()
    {
        return '{{Users_list}}';
    }
}