<?php
namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use app\models\Users_list;
use app\models\UserEducation;
use yii\filters\VerbFilter;
use yii\web\Response;
use yii\data\ActiveDataProvider;
use phpDocumentor\Reflection\Types\Null_;

class MainController extends Controller
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

    public function actionGetusers($page = 1)
    {
        $userlist = Users_list::find();

        $pageAjax = $page - 1;
        $csrf = Yii::$app->request->getCsrfToken();

        $provider = new ActiveDataProvider([
            'query' => $userlist,
            'pagination' => [
                'pageSize' => 20,
                'page' => $pageAjax
            ]
        ]);

        $users = $provider->getModels();
        $totalusers = $provider->getTotalCount();

        Yii::$app->response->format = Response::FORMAT_JSON;
        $result = [
            'success' => true,
            'message' => '...',
            'csrf' => $csrf,
            'total' => $totalusers,
            'data' => $users
        ];
        return $result;
    }

    public function actionUpdate()
    {
        $request = Yii::$app->request;
        $post = $request->post();
        $msg = 'Во время обновления произошли ошибки!!!';
        $rec = $post['user'];
        $dec_rec = null;
        $model = null;
        $user = null;

        if (isset($rec)) {
            $dec_rec = json_decode($rec, true);
            $id = $dec_rec['user_id'];
            $model = UserEducation::findOne($id);
            $model->education_id = $dec_rec['education_id'];
            $model->save();
            $msg = 'Успешно обновлено!!!';
            $user = Users_list::find()->where([
                'user_id' => $id
            ])->one();
        }

        Yii::$app->response->format = Response::FORMAT_JSON;

        $result = [
            'success' => true,
            'message' => $msg,
            'data' => $user
        ];
        return $result;
    }

    public function actionIndex()
    {
        return $this->render('index');
    }
}