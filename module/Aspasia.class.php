<?php

namespace FreePBX\modules;

use BMO;
use FreePBX_Helpers;
use PDO;
use Exception;

class Helloworld extends FreePBX_Helpers implements BMO
{
    public $FreePBX = null;

    public function __construct($freepbx = null)
    {
        if ($freepbx == null) {
            throw new Exception("Not given a FreePBX Object");
        }
        $this->FreePBX = $freepbx;
        $this->Database = $freepbx->Database;
    }

    public function install()
    {
        // Installer logic here
    }

    public function uninstall()
    {
        // Uninstaller logic here
    }

    public function doConfigPageInit($page)
    {
    }

    public function getActionBar($request)
    {
    }

    public function ajaxRequest($command, &$setting)
    {
	return false;
    }

    public function ajaxHandler()
    {
    }

    public function myDialplanHooks()
    {
        return true;
    }

    public function doDialplanHook(&$ext, $engine, $priority)
    {
    }
    
    public function showPage()
    {

    }
}

