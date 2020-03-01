<?php

namespace app\admin\controller\music;

use app\admin\model\music\Tag_model;
use app\common\controller\Backend;

/**
 * 音乐app标签分类管理
 *
 * @icon fa fa-circle-o
 */
class Tag extends Backend
{
    
    /**
     * Tag_model模型对象
     * @var \app\admin\model\music\Tag_model
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\music\Tag_model;

        $top_options = Tag_model::getTopOptions();
        $this->assign('top_options',$top_options);

    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */

    public function index()
    {
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                ->where($where)
                ->order($sort, $order)
                ->count();

            $list = $this->model
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            $list = collection($list)->toArray();

            foreach ($list as $k => $v){
                $pname = (new Tag_model)->where('id',$v['parent_id'])->value('name');
                $list[$k]['full_parent_name'] = $pname;

                $list[$k]['name'] = $v['parent_id']==0?$v['name']:" |-- {$v['name']}";
            }

            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }


}
