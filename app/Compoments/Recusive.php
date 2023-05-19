<?php
namespace App\Compoments;

/**
 * 
 */
class Recusive
{
	private $data;
	private $htlmSelect;
	
	function __construct($data)
	{
		$this->data = $data;
		$this->htlmSelect = "";
	}
	function categoryRecusive($parentID,$id = 0, $text = ''){
    	foreach ($this->data as $value) {
    		if ($value['parent_id'] == $id) {
    			if (!empty($parentID) && $parentID == $value['id']) {
    				$this->htlmSelect .= "<option selected value='". $value['id'] ."'>" . $text . $value['name'] . "</option>";
    			}else{
    				$this->htlmSelect .= "<option value='". $value['id'] ."'>" . $text . $value['name'] . "</option>";
    			}
    			
    			$this->categoryRecusive($parentID,$value['id'], $text. '-');
    		}
    	}
    	return $this->htlmSelect;
    }
}
?>