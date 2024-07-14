<?php
namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use app\models\Users_list;
use yii\filters\VerbFilter;
use yii\web\Response;
use yii\data\ActiveDataProvider;
use phpDocumentor\Reflection\Types\Null_;
use app\models\Education;

class EducationController extends Controller
{
    
    public function beforeAction($action)
    {
        // if ($action->id == 'my-method') {
        $this->enableCsrfValidation = false;
        // }
        return parent::beforeAction($action);
    }
    
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => [
                    'logout'
                ],
                'rules' => [
                    [
                        'actions' => [
                            'logout'
                        ],
                        'allow' => true,
                        'roles' => [
                            '@'
                        ]
                    ]
                ]
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => [
                        'post'
                    ]
                ]
            ]
        ];
    }
    
    public function actionGet()
    {
        $edulist = Education::find();
        
        $csrf = Yii::$app->request->getCsrfToken();
        
        $provider = new ActiveDataProvider([
            'query' => $edulist
        ]);
        
        $educations = $provider->getModels();
        $total = $provider->getTotalCount();
        
        Yii::$app->response->format = Response::FORMAT_JSON;
        $result = [
            'success' => true,
            'message' => '...',
            'csrf' => $csrf,
            'total' => $total,
            'data' => $educations
        ];
        return $result;
    }
   
    public function actionIndex()
    {
        return $this->render('index');
    }
}