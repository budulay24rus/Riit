<?php

namespace app\models;

use yii\db\ActiveRecord;

class UserEducation extends ActiveRecord
{
    public static function tableName()
    {
        return '{{user_education}}';
    }
}