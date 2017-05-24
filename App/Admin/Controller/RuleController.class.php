<?php
namespace Admin\Controller;
use Think\Controller;
/**
 * 后台权限管理
 */
class RuleController extends BaseController{



    //用户组列表
    public function manage()
    {
        $lists = M('auth_group')->select();
        $this->assign('lists', $lists);
        $this->display();
    }

    //添加用户组
    public function addGroup()
    {
        if(IS_POST){
            $data = I('post.');
            $result = M('auth_group')->add($data);
            if($result){
                $this->success('操作成功');
            }else{
                $this->error('操作失败');
            }
        }else{
            $this->display();
        }
    }


    //管理员列表
    public function lists()
    {
        $lists = M('users')->select();
        $this->assign('lists', $lists);
        $this->display();
    }


    //添加管理员
    public function addAdmin()
    {
        if(IS_POST){
            $data = I('post.');
            $result = M('users')->add($data);
            if($result){
                $this->success('操作成功');
            }else{
                $this->error('操作失败');
            }

        }else{
            $this->display();
        }
    }

    // 权限列表
    public function ruleLists()
    {
        $lists = M('auth_rule')->select();
        $this->assign('lists', $lists);
        $this->display();
    }

    //添加权限
    public function addRule()
    {
        if(IS_POST){
            $data = I('post.');
            $result = M('auth_rule')->add($data);
            if($result){
                $this->success('操作成功');
            }else{
                $this->error('操作失败');
            }
        }else{
            $option = M("auth_rule")->select();
            $option = $this->getMenu($option);
            $this->assign('option', $option);
            $this->display();
        }
    }

    //添加用户组成员

 public function addGroupUser()
    {
        if(IS_POST){
            $data = I('post.');
            $result = M('auth_group_access')->add($data);
            if($result){
                $this->success('操作成功');
            }else{
                $this->error('操作失败');
            }
        }else{
            //获取所有分类

             $lists = M('users')->select();
             $this->assign('lists', $lists);
            $this->display();
        }
    }

    //分配权限
    public function rule_group()
    {
        if(IS_POST){
            $data = I('post.');
            $str = $data['rules'];
            $str = implode(',', $str);
            $result = M('auth_group')->where(array('id'=>$data['id']))->save(array('rules'=>$str));
            if($result){
                $this->success('操作成功');
            }else{
                $this->error('操作失败');
            }

        }else{
            //获取所有菜单列表
            $option = M("auth_rule")->select();
            $this->assign('option', $option);
            $this->display();
        }

    }


    protected function getMenu($items, $id = 'id', $pid = 'pid', $son = 'children')
    {
        $tree = array();
        $tmpMap = array();

        foreach ($items as $item) {
            $tmpMap[$item[$id]] = $item;
        }

        foreach ($items as $item) {
            if (isset($tmpMap[$item[$pid]])) {
                $tmpMap[$item[$pid]][$son][] = &$tmpMap[$item[$id]];
            } else {
                $tree[] = &$tmpMap[$item[$id]];
            }
        }
        return $tree;
    }




}