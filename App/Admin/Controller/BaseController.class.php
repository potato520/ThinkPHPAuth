<?php
/**
 * 后台公用控制器
 */
namespace Admin\Controller;
use Think\Controller;
class BaseController extends Controller {

    /**
     * 初始化方法
     */
    public function _initialize(){
        $_SESSION['user']['id'] = 90;
        $auth=new \Think\Auth();
        $rule_name=MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME;
        $result=$auth->check($rule_name,$_SESSION['user']['id']);
        if(!$result){
            $this->error('您没有权限访问');
        }
    }

    public function check_login()
    {
    	
    }
}