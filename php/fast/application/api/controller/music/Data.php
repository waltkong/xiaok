<?php
namespace app\api\controller\music;

use app\api\controller\Common;
use app\api\logic\music\DataLogic;
use think\Request;

class Data extends Common{

    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';

    private $logic;
    private $req;

    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $this->logic = new DataLogic();
        $this->req = request()->param(false);

    }

    public function banner_list(){
        $data = $this->logic->banner_list();
        $this->success('ok',$data);
    }

    public function ad_list(){
        $data = $this->logic->ad_list();
        $this->success('ok',$data);
    }

    public function cd_list(){
        $input = $this->req;
        $pageIndex = $input['pageIndex'] ?? 1;
        $eachPage = $input['eachPage'] ?? 10;
        $data = $this->logic->cd_list($input,$pageIndex,$eachPage);
        $this->success('ok',$data);
    }



}
