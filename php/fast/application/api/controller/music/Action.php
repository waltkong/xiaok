<?php

namespace app\api\controller\music;

use app\api\controller\Common;
use app\api\logic\music\ActionLogic;

use app\api\logic\music\BaseLogic;
use think\Request;

class Action extends Common{
    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';

    private $logic;
    private $req;

    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $this->logic = new ActionLogic();
        $this->req = request()->param(false);

    }

    //留言
    public function add_message(){
        $input = $this->req;

        $this->checkToken();
        $userInfo = $this->auth->getUserinfo();

        $res = $this->logic->add_message($input,$userInfo);
        if($res['code'] ==1){
            $this->success('ok',[]);
        }else{
            $this->error($res['msg']);
        }

    }

    public function message_list(){
        $input = $this->req;
        $pageIndex = $input['pageIndex'] ?? 1;
        $eachPage = $input['eachPage'] ?? 10;
        $data = $this->logic->message_list($input,(int)$pageIndex,(int)$eachPage);
        $this->success('ok',$data);
    }

    //收藏
    public function do_like(){
        $input = $this->req;

        $this->checkToken();
        $userInfo = $this->auth->getUserinfo();

        $res = $this->logic->do_like($input,$userInfo);
        if($res['code'] ==1){
            $this->success('ok',[]);
        }else{
            $this->error($res['msg']);
        }

    }

    //是否被收藏
    public function is_like(){
        $input = $this->req;

        $this->checkToken();
        $userInfo = $this->auth->getUserinfo();

        $res = $this->logic->is_like($input,$userInfo);
        if($res['code'] ==1){
            $this->success('ok',[]);
        }else{
            $this->error($res['msg']);
        }
    }

    //获取所有的个人收藏专辑名
    public function collection_box_list(){
        $input = $this->req;
        $this->checkToken();
        $userInfo = $this->auth->getUserinfo();

        BaseLogic::$userinfo = $userInfo;

        $data = $this->logic->collection_box_list($input,$userInfo);
        $this->success('ok',$data);
    }


    public function collection_list(){
        $input = $this->req;
        $pageIndex = $input['pageIndex'] ?? 1;
        $eachPage = $input['eachPage'] ?? 10;

        $this->checkToken();
        $userInfo = $this->auth->getUserinfo();
        BaseLogic::$userinfo = $userInfo;

        $data = $this->logic->collection_list($input,(int)$pageIndex,(int)$eachPage);
        $this->success('ok',$data);
    }


    public function add_collection(){
        $input = $this->req;
        $this->checkToken();
        $userInfo = $this->auth->getUserinfo();

        BaseLogic::$userinfo = $userInfo;

        $res = $this->logic->add_collection($input);
        if($res['code'] ==1){
            $this->success('ok',[]);
        }else{
            $this->error($res['msg']);
        }
    }


}