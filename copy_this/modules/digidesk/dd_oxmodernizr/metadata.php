<?php
/**
 * Metadata version
 */
$sMetadataVersion = '1.1';

/**
 * Module information
 */
$aModule = array(
    'id'          => 'dd_oxmodernizr',
    'title'       => 'Digidesk - oxModernizr',
    'description' => array(
        'de' => 'Dieses Modul versorgt Ihr Shop-Frontend mit den modernsten User-Interface-Elementen und Techniken.<br/>
                 Verf&uuml;gbare Funktionen finden Sie im Kartenreiter "Einstellungen" in diesem Moduls.<hr/>
                 <span style="color:darkred">
                     <strong>Achtung:</strong> Dieses Modul ist auf die Theme-HTML-Struktur vom Standard-Azure-Theme
                     ausgelegt. F&uuml;r eigene Themes m&uuml;ssen ggf. Anpassungen in den Templates und Scritps dieses Moduls gemacht
                     werden.
                 </span>',

        'en' => 'This module provides your shop frontend with the most advanced user-interface elements and techniques.<br/>
                 You can find the available functions in the \'settings\' tab of this module.<hr/>
                 <span style="color:darkred">
                     <strong>Attention:</strong> This module is based on the HTML theme-structure of the default-theme \'Azure\'.
                     The necessary adjustments for your own theme must be made in the templates and scripts of this module.
                 </span>',
    ),
    'thumbnail' => 'logo.png',
    'version'   => '1.0',
    'author'    => 'digidesk - media solutions',
    'url'       => 'http://www.digidesk.de',
    'email'     => 'support@digidesk.de',
    'extend'    => array(
        'oxviewconfig' => 'digidesk/dd_oxmodernizr/core/dd_oxmodernizr_oxviewconfig',
        'basket'       => 'digidesk/dd_oxmodernizr/application/controllers/dd_oxmodernizr_basket_ajax'
    ),
    'files' => array(
        'dd_oxmodernizr_minibasket_ajax' => 'digidesk/dd_oxmodernizr/application/controllers/dd_oxmodernizr_minibasket_ajax.php'
    ),
    'blocks' => array(
        array( 'template' => 'layout/base.tpl',                  'block' => 'base_js',           'file' => '/views/blocks/layout/base_js.tpl' ),
        array( 'template' => 'layout/base.tpl',                  'block' => 'base_style',        'file' => '/views/blocks/layout/base_style.tpl' ),
        array( 'template' => 'widget/minibasket/minibasket.tpl', 'block' => 'widget_minibasket', 'file' => '/views/blocks/widget/minibasket/minibasket.tpl' ),
        array( 'template' => 'page/checkout/inc/basketcontents.tpl', 'block' => 'checkout_basketcontents_basketitem_quantity', 'file' => '/views/blocks/page/checkout/inc/basketcontents.tpl' ),
    ),
    'settings' => array(
        // Performance
        array('group' => 'DD_OXMODERNIZR_SETTINGS_PERFORMANCE', 'name' => 'dd_blEnabledMinCss',             'type' => 'bool', 'position' => 1, 'value' => true),
        array('group' => 'DD_OXMODERNIZR_SETTINGS_PERFORMANCE', 'name' => 'dd_blEnabledMinJs',              'type' => 'bool', 'position' => 1, 'value' => true),

        // allgemeine Benutzerfreundlichkeit
        array('group' => 'DD_OXMODERNIZR_SETTINGS_USABILITY',   'name' => 'dd_blEnabledClearInput',         'type' => 'bool', 'position' => 1, 'value' => true),

        // Effekte
        array('group' => 'DD_OXMODERNIZR_SETTINGS_EFFECTS',     'name' => 'dd_blToBasketAnimation',         'type' => 'bool', 'position' => 1, 'value' => true),

        // Warenkorb
        array('group' => 'DD_OXMODERNIZR_SETTINGS_BASKET',      'name' => 'dd_blBasketAmount',              'type' => 'bool', 'position' => 1, 'value' => true),
        array('group' => 'DD_OXMODERNIZR_SETTINGS_BASKET',      'name' => 'dd_blBasketjQueryUiConfirm',     'type' => 'bool', 'position' => 1, 'value' => true),
        array('group' => 'DD_OXMODERNIZR_SETTINGS_BASKET',      'name' => 'dd_blBasketAjax',                'type' => 'bool', 'position' => 1, 'value' => true),
        array('group' => 'DD_OXMODERNIZR_SETTINGS_BASKET',      'name' => 'dd_blBasketDelete',              'type' => 'bool', 'position' => 1, 'value' => true),

        // Mini-Warenkorb (Header)
        array('group' => 'DD_OXMODERNIZR_SETTINGS_MINI_BASKET', 'name' => 'dd_blMiniBasketThumbs',          'type' => 'bool', 'position' => 1, 'value' => true),
        array('group' => 'DD_OXMODERNIZR_SETTINGS_MINI_BASKET', 'name' => 'dd_blMiniBasketAmount',          'type' => 'bool', 'position' => 1, 'value' => true),
        array('group' => 'DD_OXMODERNIZR_SETTINGS_MINI_BASKET', 'name' => 'dd_blMiniBasketjQueryUiConfirm', 'type' => 'bool', 'position' => 1, 'value' => true),
        array('group' => 'DD_OXMODERNIZR_SETTINGS_MINI_BASKET', 'name' => 'dd_blMiniBasketAjax',            'type' => 'bool', 'position' => 1, 'value' => true),
        array('group' => 'DD_OXMODERNIZR_SETTINGS_MINI_BASKET', 'name' => 'dd_blMiniBasketDelete',          'type' => 'bool', 'position' => 1, 'value' => true),
    )
);