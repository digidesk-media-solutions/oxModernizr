<?php
/**
 * Class dd_oxmodernizr_basket_ajax
 * Wird benutzt, um das basket.tpl per AJAX abzurufen.
 */
class dd_oxmodernizr_basket_ajax extends dd_oxmodernizr_basket_ajax_parent
{
    public function render()
    {
        /** @var $this Basket */
        $sParentTpl = parent::render();

        if( oxRegistry::getConfig()->getRequestParameter( 'renderPartial' ) )
        {
            $this->addTplParam( 'editable', true );
            $this->_sThisTemplate = 'page/checkout/inc/basketcontents.tpl';
            return $this->_sThisTemplate;
        }

        return $sParentTpl;
    }
}
