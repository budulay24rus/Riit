<?php

namespace app\models;

use yii\db\ActiveRecord;

class Education extends ActiveRecord
{
    public static function tableName()
    {
        return '{{education}}';
    }

}