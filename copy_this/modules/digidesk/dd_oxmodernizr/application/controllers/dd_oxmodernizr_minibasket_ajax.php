<?php
/**
 * Class dd_oxmodernizr_minibasket_ajax
 * Wird benutzt, um das minibasket.tpl per AJAX abzurufen.
 */
class dd_oxmodernizr_minibasket_ajax extends oxUBase
{
    /**
     * Current class template name.
     * @var string
     */
    protected $_sThisTemplate = 'widget/header/minibasket.tpl';


    public function render()
    {
        parent::render();
        return $this->_sThisTemplate;
    }
}
